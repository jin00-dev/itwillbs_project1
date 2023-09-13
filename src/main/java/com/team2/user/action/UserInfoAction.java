package com.team2.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team2.user.DB.UserDAO;
import com.team2.user.DB.UserDTO;
import com.team2.util.Action;
import com.team2.util.ActionFoward;

public class UserInfoAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionFoward forward = new ActionFoward();
		HttpSession session = req.getSession();
		
		String id = (String) session.getAttribute("user_id");
		
		UserDAO dao = new UserDAO();
		UserDTO dto = dao.getUserInfo(id);
		
		req.setAttribute("userInfo", dto);
		
		forward.setPath("./user/userInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
