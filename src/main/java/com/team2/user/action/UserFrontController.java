package com.team2.user.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.util.Action;
import com.team2.util.ActionForward;

public class UserFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		////주소 계산//////////////////////////
		String uri = request.getRequestURI();
		System.out.println(uri);
		String ss = request.getContextPath();
		String command = uri.substring(ss.length());
		
		Action action = null;
		ActionForward forward = null;
		////이동 방식 계산////////////////////
		
		//로그인 페이지
		if( command.equals("/UserLogin.me") ) {
			forward = new ActionForward();
			forward.setPath("./user/loginForm.jsp");
			forward.setRedirect(false);
		}
		//로그인 처리
		else if( command.equals("/UserLoginAction.me") ) {
			action = new UserLoginAction();
			
			try {
				forward =  action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//로그인 아이디 중복 확인
		else if(command.equals("/UserIdCheckAction.me")) {
			action = new UserIdCheckAction();
			
			try {
				forward =  action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//비회원 로그인 처리
		else if( command.equals("/NonUserLoginAction.me") ) {
			action = new NonUserLoginAction();
			
			try {
				forward =  action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//메인 페이지
		else if( command.equals("/Main.me") ) {
			forward = new ActionForward();
			forward.setPath("./main.jsp");
			forward.setRedirect(false);
		}
		//로그아웃 처리
		else if( command.equals("/UserLogoutAction.me") ) {
			action = new UserLogoutAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//아이디 찾기
		else if( command.equals("/UserFindId.me") ) {
			forward = new ActionForward();
			forward.setPath("./user/findIdForm.jsp");
			forward.setRedirect(false);
		}
		//아이디 찾기 처리
		else if( command.equals("/UserFindIdAction.me") ) {
			action = new UserFindIdAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//비밀번호 찾기	
		else if( command.equals("/UserFindPw.me") ) {
			forward = new ActionForward();
			forward.setPath("./user/findPwForm.jsp");
			forward.setRedirect(false);
		}
		//비밀번호 찾기 처리
		else if( command.equals("/UserFindPwAction.me") ) {
			action = new UserFindPwAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원가입
		else if( command.equals("/UserJoin.me") ) {
			forward = new ActionForward();
			forward.setPath("./user/joinForm.jsp");
			forward.setRedirect(false);
		}
		//회원가입 처리
		else if( command.equals("/UserJoinAction.me") ) {
			action = new UserJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		//회원정보 페이지 전 정보 확인 페이지
		else if(command.equals("/UserInfoCheck.me")) {
			forward = new ActionForward();
			forward.setPath("./user/userInfoForm.jsp");
			forward.setRedirect(false);
		}
		//회원정보 일치하는지 확인
		else if(command.equals("/UserInfoCheckAction.me")) {
			action = new UserInfoCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원 정보 페이지
		else if(command.equals("/UserInfoAction.me")) {
			action = new UserInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원 정보 수정
		else if(command.equals("/UserInfoChangeAction.me")) {
			action = new UserInfoChangeAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원탈퇴 폼 페이지
		else if(command.equals("/UserDelete.me")) {
			forward = new ActionForward();
			forward.setPath("./user/deleteForm.jsp");
			forward.setRedirect(false);
		}
		//회원탈퇴 처리
		else if(command.equals("/UserDeleteAction.me")) {
			action = new UserDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//
		else if(command.equals("/UserOrderBoardAction.me") ){
			action = new UserOrderBoardAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//관리자-회원리스트 페이지
		else if(command.equals("/AdminUserInfoBoardAction.me") ){
			action = new AdminUserInfoBoardAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원등급 변경
		else if(command.equals("/UserTypeChangeAction.me")) {
			action = new UserTypeChangeAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		////3.주소로 이동//////////////////////////////////
		if( forward != null ) {
			if( forward.isRedirect() ) {
				System.out.println( forward.getPath() +" ##"+ forward.isRedirect() );     
				response.sendRedirect( forward.getPath() );
			}else {
				System.out.println( forward.getPath() +" ##"+ forward.isRedirect() );
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		System.out.println();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
		System.out.println("doGet()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
		System.out.println("doPost()");

	}

}
