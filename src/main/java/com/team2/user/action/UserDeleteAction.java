package com.team2.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.user.DB.UserDAO;
import com.team2.user.DB.UserDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;

public class UserDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		
		dto.setUser_id(req.getParameter("user_id"));
		dto.setUser_pass(req.getParameter("user_pass"));
		System.out.println(dto.getUser_id());
		System.out.println(dto.getUser_pass());
		
		int result = dao.deleteUserInfo(dto);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		if(result == 1) {
			out.println("<script>");
			out.println("alert('회원탈퇴 성공');");
			out.println("location.href='./UserLogoutAction.me'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원탈퇴 실패');");
			out.println("history.back();");
			out.println("</script>");
		}
		 
		return null;
	}

}
