package com.team2.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.events.Comment;

import com.team2.util.Action;
import com.team2.util.ActionForward;


public class BoardFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, 
							 HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" C : BoardFrontController-doProcess() 호출");
		
		////////////////////1. 가상주소 계산////////////////////////////////
		System.out.println("\n\n -----------1. 가상주소 계산 시작 ---------------");
		String requestURI = request.getRequestURI();
		System.out.println(" C : requestURI : "+requestURI);
		String CTXPath = request.getContextPath();
		System.out.println(" C : CTXPath : "+CTXPath);
		String command = requestURI.substring(CTXPath.length());
		System.out.println(" C : command : "+command);		
		System.out.println(" -----------1. 가상주소 계산 끝 ---------------");
		////////////////////1. 가상주소 계산////////////////////////////////
		
		////////////////////2. 가상주소 비교////////////////////////////////
		System.out.println("\n\n -----------2. 가상주소 비교 시작 ---------------");
		Action action = null;
		ActionForward forward = null;
		
			if(command.equals("/board/rentWrite.bo")) {
				System.out.println(" C : /board/rentWrite.bo 호출");
				
				forward = new ActionForward();
				forward.setPath("./rentBoard.jsp");
				forward.setRedirect(false); 
				// 대관문의 글쓰기 페이지로 이동 
			}
			else if(command.equals("/board/rentWriteAction.bo")) {
				System.out.println(" C : /board/rentWriteAction.bo 호출");
				
				action =new rentWriteAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}// 대관 문의 글쓰기 insert 
				
			}
			else if (command.equals("/board/CinemaSelectAction.bo")) {
				System.out.println("C : /board/CinemaSelectAction.bo 호출");
				
				action =new CinemaSelectAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
		
		
		System.out.println(" -----------2. 가상주소 비교 끝 ---------------");
		////////////////////2. 가상주소 비교////////////////////////////////
		
		////////////////////3. 가상주소 페이지이동 ////////////////////////////////
		System.out.println("\n\n -----------3. 가상주소 페이지이동 시작 ---------------");
		if(forward != null) {
			if(forward.isRedirect()) {
				System.out.println(" C : 주소 ="+forward.getPath()+",방식 : sendRedirect()");
				response.sendRedirect(forward.getPath());
			}else {
				System.out.println(" C : 주소 ="+forward.getPath()+",방식 : forward(request, response)");
				RequestDispatcher dis 
				   = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
				}		
		}
		System.out.println(" -----------3. 가상주소 페이지이동 끝 ---------------");
		////////////////////3. 가상주소 페이지이동 ////////////////////////////////
		
		
		System.out.println("\n\n -----------컨트롤러 끝 ---------------");
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, 
						 HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n -----------컨트롤러 시작 ---------------");
		System.out.println(" C : BoardFrontController-doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, 
						  HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n -----------컨트롤러 시작 ---------------");
		System.out.println(" C : BoardFrontController-doPost() 호출");
		doProcess(request, response);
	}
	
	

}
