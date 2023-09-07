package com.team2.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.user.DB.UserDAO;
import com.team2.util.Action;
import com.team2.util.ActionFoward;

public class NonUserLoginAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/html; charset=UTF-8");
		HttpSession se = req.getSession();
		
		UserDAO mDAO = new UserDAO();
		ActionFoward af = new ActionFoward();

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		System.out.println(id+"dtd");
		int result = mDAO.rogin(id, pw);
		
		if(result == -1) {
			af = null;
		}else {
			se.setAttribute("id", id);
			af.setPath("./Main.me");
			af.setPathType(true);
		}
		return af;
	}

}
