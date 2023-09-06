package com.team2.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.user.DB.UserDAO;
import com.team2.user.DB.UserDTO;
import com.team2.util.Action;
import com.team2.util.ActionFoward;


public class UserJoinAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		
		dto.setId( req.getParameter("id") );
		dto.setPw( req.getParameter("pw") );
		dto.setIdHint( req.getParameter("idHint") );
		dto.setPwHint( req.getParameter("pwHint") );
		
		int result = dao.join(dto);
		
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html; charset=UTF-8");
		
		
		if(result == -1) {
			out.println("<script>");
			out.println("alert('입력 오류');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원가입 성공');");
			out.println("location.href='./MemberLogin.me';");
			out.println("</script>");
		}

		return null;
	}
	
}
