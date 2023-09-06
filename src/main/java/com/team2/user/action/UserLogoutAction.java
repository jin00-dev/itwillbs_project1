package com.team2.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.util.Action;
import com.team2.util.ActionFoward;

public class UserLogoutAction implements Action{

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			out = resp.getWriter();
			out.println("<script>");
			out.println("alert('로그아웃 성공');");
			out.println("location.href='./Main.me';");
			out.println("</script>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
}
