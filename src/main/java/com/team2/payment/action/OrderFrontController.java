package com.team2.payment.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.util.Action;
import com.team2.util.ActionForward;



public class OrderFrontController extends HttpServlet {	

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
			System.out.println("C : doProcess()호출 !");
			
			/***************************** 1. 가상주소 계산 *******************************/
			System.out.println("\n C : 1. 가상주소 계산 - 시작");
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			// 계산된 가상주소
			String command = requestURI.substring(contextPath.length());
			System.out.println("command : " + command);
			System.out.println("C : 가상주소 계산 - 끝");
			/***************************** 1. 가상주소 계산 *******************************/
			
			/***************************** 2. 가상주소 매핑 *******************************/
			System.out.println("\n C : 가상주소 매핑 - 시작");
			Action action = null;
			ActionForward forward = null;
			
			if(command.equals("/orderMain.or")){
				System.out.println("C : orderMain.or 호출");
				System.out.println("C : 패턴1 - 페이지이동");
				
				forward = new ActionForward();
				forward.setPath("./order/orderMain.jsp");
				forward.setRedirect(false);
				
			}else if(command.equals("/cinemaInfo.or")) {
				System.out.println("C : cinemaInfo.or 호출");
				System.out.println("C : 패턴2or3 - db사용x 비동기처리");
				
				action = new CinemaAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/theaterInfo.or")) {
				System.out.println("C : theaterInfo.or 호출");
				System.out.println("C : 패턴2or3 - db사용x 비동기처리");
				
				action = new TheaterAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/movieInfo.or")) {
				System.out.println("C : movieInfo.or 호출");
				System.out.println("C : 패턴2or3 - db사용o 비동기처리");
				
				action = new MovieAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/seatPayment.or")) {
				System.out.println("C : seatPayment.or 호출");
				System.out.println("C : 패턴2 - db사용o, 페이지이동");
				
				action = new SeatPaymentAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/seatPaymentPro.or")) {
				System.out.println("C : seatPaymentPro.or 호출");
				System.out.println("C : 패턴1 - 페이지이동 ");
				
				forward = new ActionForward();
				forward.setPath("./order/orderMainPro.jsp");
				forward.setRedirect(false);
			}
			
			
			
			System.out.println("C : 가상주소 매핑 - 끝");
			/***************************** 2. 가상주소 매핑 *******************************/
			
			/***************************** 3. 가상주소 이동 *******************************/
			System.out.println("\n C : 가상주소 이동 - 시작");

			if (forward != null) { // forward != null -> 티켓이 있을때(패턴1이 정상실행)
				if (forward.isRedirect()) { // 이동방식이 true, false에따라 지정
					System.out.println("C : " + forward.getPath() + " 주소로 방식 : " + forward.isRedirect());
					response.sendRedirect(forward.getPath());
				} else {
					System.out.println("C : " + forward.getPath() + " 주소로 방식 : " + forward.isRedirect());
					RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
					dis.forward(request, response);
				}
			}
			System.out.println("C : 가상주소 이동 - 끝");
			/***************************** 3. 가상주소 이동 *******************************/
			System.out.println("========== 컨트롤러 끝 ============");
			
			
			
	}
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		doProcess(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request,response);
	}
}
