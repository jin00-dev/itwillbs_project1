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
			}// 대관문의 극장 select
			
		} 
		else if(command.equals("/board/qnaBoard.bo")) {
			System.out.println(" C : /board/qnaBoard.bo 호출");
			System.out.println(" C : 패턴1 - DB사용X, 페이지이동");

			forward = new ActionForward();
			
			forward.setPath("./qnaBoard.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/board/qnaBoardList.bo")) {
			System.out.println(" C : /board/qnaBoardList.bo 호출");
			System.out.println(" C : 패턴3 - DB사용0, 페이지이동");

			// BoardListAction
			action = new QnaBoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/board/faqMain.bo")) {
			System.out.println(" C : /board/faqMain.bo 호출");
			System.out.println(" C : 패턴3 - DB사용0, 페이지이동");

			// BoardListAction
			action = new FaqMainAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/board/noticeMain.bo")) {
			System.out.println(" C : /board/noticeMain.bo 호출");
			System.out.println(" C : 패턴3 - DB사용0, 페이지이동");

			// BoardListAction
			action = new NoticeMainAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/board/QnaBoardAction.bo")) {
			System.out.println(" C : /board/qnaBoardAction.bo 호출");
			System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
			
			//BoardUpdateAction 객체
			action = new QnaBoardAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/board/faqBoardAdd.bo")) {
			System.out.println(" C : /board/faqBoardAdd.bo 호출");
			System.out.println(" C : 패턴1- DB사용X, 페이지 이동");
			
			forward = new ActionForward();
			forward.setPath("./faqBoardAdd.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/board/faqBoardAddAction.bo")) {
			System.out.println(" C : /board/faqBoardAddAction.bo 호출");
			System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
			
			//BoardUpdateAction 객체
			action = new FaqBoardAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/board/noticeBoardAdd.bo")) {
			System.out.println(" C : /board/noticeBoardAdd.bo 호출");
			System.out.println(" C : 패턴1- DB사용X, 페이지 이동");
			
			forward = new ActionForward();
			forward.setPath("./noticeBoardAdd.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/board/noticeBoardAddAction.bo")) {
			System.out.println(" C : /board/noticeBoardAddAction.bo 호출");
			System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
			
			//BoardUpdateAction 객체
			action = new NoticeBoardAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/board/qnaBoardContent.bo")) {
			System.out.println(" C : /board/qnaBoardContent.bo 호출");
			System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
			
			//BoardUpdateAction 객체
			action = new QnaBoardContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/board/noticeBoardContent.bo")) {
			System.out.println(" C : /board/noticeBoardContent.bo 호출");
			System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
			
			//BoardUpdateAction 객체
			action = new NoticeBoardContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/board/qnaBoardUpdate.bo")) {
			System.out.println(" C : /board/qnaBoardUpdate.bo 호출 ");
			System.out.println(" C : 패턴 3 - DB사용O,페이지 출력");
			// BoardUpdateAction
			action = new QnaBoardUpdateAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/board/qnaBoardUpdatePro.bo")) {
			System.out.println(" C : /board/qnaBoardUpdatePro.bo 호출 ");
			System.out.println(" C : 패턴2 - DB사용O,페이지 이동");
			
			// BoardUpdateProAction 객체 
			action = new QnaBoardUpdateProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/board/qnaBoardDelete.bo")) {
			System.out.println(" C : /board/qnaBoardDelete.bo 호출 ");
			System.out.println(" C : 패턴1 - DB사용X,페이지이동 ");
			
			forward = new ActionForward();
			forward.setPath("./qnaBoardDelete.jsp");
			forward.setRedirect(false);		
		}
		else if(command.equals("/board/qnaBoardDeleteAction.bo")) {
			System.out.println(" C : /board/qnaBoardDeleteAction.bo 호출 ");
			System.out.println(" C : 패턴2 - DB사용O, 페이지이동");
			
			// BoardDeleteAction() 객체
			action = new QnaBoardDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		else if(command.equals("/board/qnaBoardAnswer.bo")) {
			System.out.println(" C : /board/qnaBoardAnswer.bo 호출 ");
			System.out.println(" C : 패턴 3 - DB사용O,페이지 출력");
			// BoardUpdateAction
			action = new QnaBoardAnswerAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/board/noticeBoardDelete.bo")) {
			System.out.println(" C : /board/noticeBoardDelete.bo 호출 ");
			System.out.println(" C : 패턴1 - DB사용X,페이지이동 ");
			
			forward = new ActionForward();
			forward.setPath("./noticeBoardDelete.jsp");
			forward.setRedirect(false);	
		}
		else if(command.equals("/board/noticeBoardDeleteAction.bo")) {
			System.out.println(" C : /board/noticeBoardDeleteAction.bo 호출 ");
			System.out.println(" C : 패턴2 - DB사용O, 페이지이동");
			
			// BoardDeleteAction() 객체
			action = new NoticeBoardDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		else if(command.equals("/board/noticeBoardUpdate.bo")) {
			System.out.println(" C : /board/noticeBoardUpdate.bo 호출 ");
			System.out.println(" C : 패턴 3 - DB사용O,페이지 출력");
			// BoardUpdateAction
			action = new NoticeBoardUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/board/noticeBoardUpdatePro.bo")) {
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
