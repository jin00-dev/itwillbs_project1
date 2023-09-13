package com.team2.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.user.DB.UserDAO;
import com.team2.user.DB.UserDTO;
import com.team2.util.Action;
import com.team2.util.ActionFoward;

public class UserInfoCheckAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO dao = new UserDAO();
		ActionFoward forward = new ActionFoward();
		
		String id = req.getParameter("user_id");
		String pw = req.getParameter("user_pass");
		
		int result = dao.rogin(id, pw);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		System.out.println(result);
		
		if(result == 1) {
			forward.setPath("./UserInfoAction.me");
			forward.setRedirect(true);
		}else {
			out.println("<script>");
			out.println("alert('다시 입력해 주세요.');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}

}
