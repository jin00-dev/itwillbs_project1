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
		System.out.println("\n =========C : 1. 가상주소 계산 - 시작=========");
		
		String requestURI = request.getRequestURI();
		System.out.println(" C : requestURI : "+requestURI);
		String CTXPath  = request.getContextPath();
		System.out.println(" C : CTXPath : "+CTXPath);
		String command = requestURI.substring(CTXPath.length());
		System.out.println(" C : command : "+command);
		
		
		System.out.println(" =========C : 1. 가상주소 계산 - 끝=========");
		/*************************1. 가상주소 계산**************************************/
		
		/*************************2. 가상주소 비교**************************************/
		System.out.println("\n =========C : 2. 가상주소 비교 - 시작=========");
			Action action = null;
			ActionForward forward = null;
			if(command.equals("/qnaBoard.bo")) {
				System.out.println(" C : /qnaBoard.bo 호출");
				System.out.println(" C : 패턴1 - DB사용X, 페이지이동");

				forward = new ActionForward();
				
				forward.setPath("./board/qnaBoard.jsp");
				forward.setRedirect(false);
			}
			else if(command.equals("/qnaBoardList.bo")) {
				System.out.println(" C : /qnaBoardList.bo 호출");
				System.out.println(" C : 패턴3 - DB사용0, 페이지이동");

				// BoardListAction
				action = new QnaBoardListAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/faqMain.bo")) {
				System.out.println(" C : /faqMain.bo 호출");
				System.out.println(" C : 패턴3 - DB사용0, 페이지이동");

				// BoardListAction
				action = new FaqMainAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/noticeMain.bo")) {
				System.out.println(" C : /noticeMain.bo 호출");
				System.out.println(" C : 패턴3 - DB사용0, 페이지이동");

				// BoardListAction
				action = new NoticeMainAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/QnaBoardAction.bo")) {
				System.out.println(" C :/qnaBoardAction.bo 호출");
				System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
				
				//BoardUpdateAction 객체
				action = new QnaBoardAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/faqBoardAdd.bo")) {
				System.out.println(" C : /faqBoardAdd.bo 호출");
				System.out.println(" C : 패턴1- DB사용X, 페이지 이동");
				
				forward = new ActionForward();
				forward.setPath("./board/faqBoardAdd.jsp");
				forward.setRedirect(false);
			}
			else if(command.equals("/faqBoardAddAction.bo")) {
				System.out.println(" C : /faqBoardAddAction.bo 호출");
				System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
				
				//BoardUpdateAction 객체
				action = new ENFBoardAddAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/noticeBoardAdd.bo")) {
				System.out.println(" C : /noticeBoardAdd.bo 호출");
				System.out.println(" C : 패턴1- DB사용X, 페이지 이동");
				
				forward = new ActionForward();
				forward.setPath("./board/noticeBoardAdd.jsp");
				forward.setRedirect(false);
			}
			else if(command.equals("/noticeBoardAddAction.bo")) {
				System.out.println(" C : /noticeBoardAddAction.bo 호출");
				System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
				
				//BoardUpdateAction 객체
				action = new ENFBoardAddAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/rentMain.bo")) {
				System.out.println(" C : /rentMain.bo 호출");

				forward = new ActionForward();
				forward.setPath("./board/rentMain.jsp");
				forward.setRedirect(false); 
				// 대관문의 메인 페이지로 이동 
				
			}
			else if(command.equals("/rentWrite.bo")) {
				System.out.println(" C : /rentWrite.bo 호출");

				forward = new ActionForward();
				forward.setPath("./board/rentBoard.jsp");
				forward.setRedirect(false); 
				// 대관문의 글쓰기 페이지로 이동 
			}
			else if(command.equals("/rentWriteAction.bo")) {
				System.out.println(" C : /rentWriteAction.bo 호출");

				action =new rentWriteAction();

				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}// 대관 문의 글쓰기 insert 

			}
			else if (command.equals("/CinemaSelectAction.bo")) {
				System.out.println("C : /CinemaSelectAction.bo 호출");

				action =new CinemaSelectAction();

				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}// 대관문의 극장 select
			}
			else if(command.equals("/qnaBoardContent.bo")) {
				System.out.println(" C : /qnaBoardContent.bo 호출");
				System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
				
				//BoardUpdateAction 객체
				action = new QnaBoardContentAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/noticeBoardContent.bo")) {
				System.out.println(" C : /noticeBoardContent.bo 호출");
				System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
				
				//BoardUpdateAction 객체
				action = new ENFBoardContentAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/qnaBoardUpdate.bo")) {
				System.out.println(" C : /qnaBoardUpdate.bo 호출 ");
				System.out.println(" C : 패턴 3 - DB사용O,페이지 출력");
				// BoardUpdateAction
				action = new QnaBoardUpdateAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/qnaBoardUpdatePro.bo")) {
				System.out.println(" C : /qnaBoardUpdatePro.bo 호출 ");
				System.out.println(" C : 패턴2 - DB사용O,페이지 이동");
				
				// BoardUpdateProAction 객체 
				action = new QnaBoardUpdateProAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/qnaBoardDelete.bo")) {
				System.out.println(" C : /qnaBoardDelete.bo 호출 ");
				System.out.println(" C : 패턴1 - DB사용X,페이지이동 ");
				
				forward = new ActionForward();
				forward.setPath("./board/qnaBoardDelete.jsp");
				forward.setRedirect(false);		
			}
			else if(command.equals("/qnaBoardDeleteAction.bo")) {
				System.out.println(" C : /qnaBoardDeleteAction.bo 호출 ");
				System.out.println(" C : 패턴2 - DB사용O, 페이지이동");
				
				// BoardDeleteAction() 객체
				action = new QnaBoardDeleteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}			
			}
			else if(command.equals("/qnaBoardAnswer.bo")) {
				System.out.println(" C : /qnaBoardAnswer.bo 호출 ");
				System.out.println(" C : 패턴 3 - DB사용O,페이지 출력");
				// BoardUpdateAction
				action = new QnaBoardAnswerAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/noticeBoardDelete.bo")) {
				System.out.println(" C : /noticeBoardDelete.bo 호출 ");
				System.out.println(" C : 패턴1 - DB사용X,페이지이동 ");
				
				forward = new ActionForward();
				forward.setPath("./board/noticeBoardDelete.jsp");
				forward.setRedirect(false);	
			}
			else if(command.equals("/noticeBoardDeleteAction.bo")) {
				System.out.println(" C : /noticeBoardDeleteAction.bo 호출 ");
				System.out.println(" C : 패턴2 - DB사용O, 페이지이동");
				
				// BoardDeleteAction() 객체
				action = new ENFBoardDeleteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}	
			}
			else if(command.equals("/noticeBoardUpdate.bo")) {
				System.out.println(" C : /noticeBoardUpdate.bo 호출 ");
				System.out.println(" C : 패턴 3 - DB사용O,페이지 출력");
				// BoardUpdateAction
				action = new ENFBoardUpdateAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/noticeBoardUpdatePro.bo")) {
				System.out.println(" C : /noticeBoardUpdatePro.bo 호출 ");
				System.out.println(" C : 패턴2 - DB사용O,페이지 이동");
				
				// BoardUpdateProAction 객체 
				action = new ENFBoardUpdateProAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/enfBoardSearch.bo")) {
				System.out.println(" C : /enfBoardSearch.bo 호출");
				System.out.println(" C : 패턴3 - DB사용0, 페이지이동");

				// BoardListAction
				action = new ENFBoardSearchAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/qrBoardSearch.bo")) {
				System.out.println(" C : /qrBoardSearch.bo 호출");
				System.out.println(" C : 패턴3 - DB사용0, 페이지이동");
		
				// BoardListAction
				action = new QRBoardSearchAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/eventMain.bo")) {
				System.out.println(" C : /eventMain.bo 호출");
				System.out.println(" C : 패턴1 - DB사용X, 페이지이동");

				forward = new ActionForward();
				
				forward.setPath("./event/eventMain.jsp");
				forward.setRedirect(false);
			}
			else if(command.equals("/eventContent.bo")) {
				System.out.println(" C : /eventContent.bo 호출");
				System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
				
				//BoardUpdateAction 객체
				action = new ENFBoardContentAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/introduceMain.bo")) {
				System.out.println(" C : /introduceMain.bo 호출");
				System.out.println(" C : 패턴3 - DB사용O, 페이지출력");
				
				//introduceMainAction 객체
				action = new introduceMainAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			
			
		System.out.println(" =========C : 2. 가상주소 비교 - 끝=========");
		
		/*************************3. 가상주소 페이지이동**************************************/
		System.out.println("\n =========C : 3. 가상주소 페이지이동 - 시작=========");
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
		System.out.println(" =========C : 3. 가상주소 페이지이동 - 끝=========");
		/*************************3. 가상주소 페이지이동**************************************/
		
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
