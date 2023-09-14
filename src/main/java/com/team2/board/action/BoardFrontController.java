package com.team2.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.util.Action;
import com.team2.util.ActionForward;

public class BoardFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" C : BoardFrontController-doProess() 호출");
		/*************************1. 가상주소 계산**************************************/
		System.out.println("\n C : 1. 가상주소 계산 - 시작");
		
		String requestURI = request.getRequestURI();
		System.out.println(" C : requestURI : "+requestURI);
		String CTXPath  = request.getContextPath();
		System.out.println(" C : CTXPath : "+CTXPath);
		String command = requestURI.substring(CTXPath.length());
		System.out.println(" C : command : "+command);
		
		
		System.out.println(" C : 1. 가상주소 계산 - 끝");
		/*************************1. 가상주소 계산**************************************/
		
		/*************************2. 가상주소 비교**************************************/
		System.out.println("\n C : 2. 가상주소 비교 - 시작");
			Action action = null;
			ActionForward forward = null;
			if(command.equals("/board/qnaBoard.bo")) {
				System.out.println(" C : /board/qnaBoard.bo 호출");
				System.out.println(" C : 패턴1 - DB사용X, 페이지이동");

				forward = new ActionForward();
				
				forward.setPath("./qnaBoard.jsp");
				forward.setRedirect(false);
			}else if(command.equals("/board/qnaBoardList.bo")) {
				System.out.println(" C : /board/qnaBoardList.bo 호출");
				System.out.println(" C : 패턴3 - DB사용0, 페이지이동");

				// BoardListAction
				action = new QnaBoardListAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(command.equals("/board/faqMain.bo")) {
				System.out.println(" C : /board/faqMain.bo 호출");
				System.out.println(" C : 패턴3 - DB사용0, 페이지이동");

				// BoardListAction
				action = new FaqMainAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(command.equals("/board/noticeMain.bo")) {
				System.out.println(" C : /board/noticeMain.bo 호출");
				System.out.println(" C : 패턴3 - DB사용0, 페이지이동");

				// BoardListAction
				action = new NoticeMainAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(command.equals("/board/QnaBoardAction.bo")) {
				System.out.println(" C : /board/qnaBoardAction.bo 호출");
				System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
				
				//BoardUpdateAction 객체
				action = new QnaBoardAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(command.equals("/board/faqBoardAdd.bo")) {
				System.out.println(" C : /board/faqBoardAdd.bo 호출");
				System.out.println(" C : 패턴1- DB사용X, 페이지 이동");
				
				forward = new ActionForward();
				forward.setPath("./faqBoardAdd.jsp");
				forward.setRedirect(false);
			}else if(command.equals("/board/faqBoardAddAction.bo")) {
				System.out.println(" C : /board/faqBoardAddAction.bo 호출");
				System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
				
				//BoardUpdateAction 객체
				action = new FaqBoardAddAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(command.equals("/board/noticeBoardAdd.bo")) {
				System.out.println(" C : /board/noticeBoardAdd.bo 호출");
				System.out.println(" C : 패턴1- DB사용X, 페이지 이동");
				
				forward = new ActionForward();
				forward.setPath("./noticeBoardAdd.jsp");
				forward.setRedirect(false);
			}else if(command.equals("/board/noticeBoardAddAction.bo")) {
				System.out.println(" C : /board/noticeBoardAddAction.bo 호출");
				System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
				
				//BoardUpdateAction 객체
				action = new NoticeBoardAddAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(command.equals("/board/rentBoard.bo")) {
				System.out.println(" C : /board/rentBoard.bo 호출");
				System.out.println(" C : 패턴1- DB사용X, 페이지 이동");
				
				forward = new ActionForward();
				forward.setPath("./rentBoardAdd.jsp");
				forward.setRedirect(false);
			}else if(command.equals("/board/qnaBoardContent.bo")) {
				System.out.println(" C : /board/qnaBoardContent.bo 호출");
				System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
				
				//BoardUpdateAction 객체
				action = new QnaBoardContentAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(command.equals("/board/noticeBoardContent.bo")) {
				System.out.println(" C : /board/noticeBoardContent.bo 호출");
				System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
				
				//BoardUpdateAction 객체
				action = new NoticeBoardContentAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(command.equals("/board/qnaBoardUpdate.bo")) {
				System.out.println(" C : /board/qnaBoardUpdate.bo 호출 ");
				System.out.println(" C : 패턴 3 - DB사용O,페이지 출력");
				// BoardUpdateAction
				action = new QnaBoardUpdateAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/board/qnaBoardUpdatePro.bo")) {
				System.out.println(" C : /board/qna/BoardUpdatePro.bo 호출 ");
				System.out.println(" C : 패턴2 - DB사용O,페이지 이동");
				
				// BoardUpdateProAction 객체 
				action = new QnaBoardUpdateProAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/board/qnaBoardDelete.bo")) {
				System.out.println(" C : /board/qna/BoardDelete.bo 호출 ");
				System.out.println(" C : 패턴1 - DB사용X,페이지이동 ");
				
				forward = new ActionForward();
				forward.setPath("./qnaBoardDelete.jsp");
				forward.setRedirect(false);		
			}else if(command.equals("/board/qnaBoardDeleteAction.bo")) {
				System.out.println(" C : /board/qnaBoardDeleteAction.bo 호출 ");
				System.out.println(" C : 패턴2 - DB사용O, 페이지이동");
				
				// BoardDeleteAction() 객체
				action = new QnaBoardDeleteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}			
			}else if(command.equals("/board/qnaBoardAnswer.bo")) {
				System.out.println(" C : /board/qnaBoardAnswer.bo 호출 ");
				System.out.println(" C : 패턴 3 - DB사용O,페이지 출력");
				// BoardUpdateAction
				action = new QnaBoardAnswerAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/board/noticeBoardDelete.bo")) {
				System.out.println(" C : /board/noticeBoardDelete.bo 호출 ");
				System.out.println(" C : 패턴1 - DB사용X,페이지이동 ");
				
				forward = new ActionForward();
				forward.setPath("./noticeBoardDelete.jsp");
				forward.setRedirect(false);	
			}else if(command.equals("/board/noticeBoardDeleteAction.bo")) {
				System.out.println(" C : /board/noticeBoardDeleteAction.bo 호출 ");
				System.out.println(" C : 패턴2 - DB사용O, 페이지이동");
				
				// BoardDeleteAction() 객체
				action = new NoticeBoardDeleteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}	
			}else if(command.equals("/board/noticeBoardUpdate.bo")) {
				System.out.println(" C : /board/noticeBoardUpdate.bo 호출 ");
				System.out.println(" C : 패턴 3 - DB사용O,페이지 출력");
				// BoardUpdateAction
				action = new NoticeBoardUpdateAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/board/noticeBoardUpdatePro.bo")) {
				System.out.println(" C : /board/noticeBoardUpdatePro.bo 호출 ");
				System.out.println(" C : 패턴2 - DB사용O,페이지 이동");
				
				// BoardUpdateProAction 객체 
				action = new NoticeBoardUpdateProAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		System.out.println(" C : 2. 가상주소 비교 - 끝");
		/*************************2. 가상주소 비교**************************************/
		
		/*************************1. 가상주소 페이지이동**************************************/
		System.out.println("\n C : 3. 가상주소 페이지이동 - 시작");
		if(forward != null) {
			if(forward.isRedirect()) {
				System.out.println(" C : 주소 = "+forward.getPath()+", 방식 : sendRedirect()");
				response.sendRedirect(forward.getPath());
			}else {
				System.out.println(" C : 주소 = "+forward.getPath()+", 방식 : forward(request, response)");
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		System.out.println(" C : 3. 가상주소 페이지이동 - 끝");
		/*************************1. 가상주소 페이지이동**************************************/
		
		System.out.println("\n\n -----------------컨트롤러 끝------------------");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n -----------------컨트롤러 시작------------------");
		System.out.println(" C : BoardFrontController-doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n -----------------컨트롤러 시작------------------");
		System.out.println(" C : BoardFrontController-doPost() 호출");
		doProcess(request, response);
		
	}

}
