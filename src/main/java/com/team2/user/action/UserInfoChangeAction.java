package com.team2.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.user.DB.UserDAO;
import com.team2.user.DB.UserDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;

public class UserInfoChangeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward = null;
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		
		dto.setUser_id(req.getParameter("user_id"));
		dto.setUser_name(req.getParameter("user_name"));
		dto.setUser_phone(req.getParameter("user_phone"));
		dto.setUser_pass(req.getParameter("user_pass"));
		
		int result = dao.updateUserInfo(dto);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();

		if(result == 1) {
			out.println("<script>");
			out.println("alert('회원정보 수정 성공');");
			out.println("location.href='./UserInfoAction.me'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원정보 수정 실패');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}

}
