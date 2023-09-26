package com.team2.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.user.DB.NonUserDAO;
import com.team2.user.DB.NonUserDTO;
import com.team2.user.DB.UserDAO;
import com.team2.util.Action;
import com.team2.util.ActionForward;

public class NonUserLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		NonUserDAO dao = new NonUserDAO();
		NonUserDTO dto = new NonUserDTO();		
		
		dto.setNonuser_name(request.getParameter("nonuser_name"));
		dto.setNonuser_phone(request.getParameter("nonuser_phone"));
		dto.setNonuser_pass(request.getParameter("nonuser_pass"));
		System.out.println(dto.getNonuser_name());
		int result = dao.nonlogin(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println(result);
		if(result == -1 || result ==0 ) {
			
			out.println("<script>");
			out.println("alert('다시 입력해 주세요');");
			out.println("history.back();");
			out.println("</script>");
			
		}else {
			out.println("<script>");
			out.println("alert('예매페이지로 이동합니다');");
			out.println("location.href='./orderMain.or'");
			out.println("</script>");
		}
		
		return null;
	}
	
	
}

