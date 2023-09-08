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
		
			if(command.equals("/QnAWriteBoard.bo")) {
				System.out.println(" C : /QnAWriteBoard.bo 호출");
				System.out.println(" C : 패턴 1 - DB사용 X, 페이지 이동 ");
				
				forward = new ActionForward();
				forward.setPath("./board/qnaBoard.jsp");
				forward.setRedirect(false);
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
