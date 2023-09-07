package com.team2.user.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.user.DB.UserDAO;
import com.team2.user.DB.UserDTO;
import com.team2.util.Action;
import com.team2.util.ActionFoward;

public class UserFindPwAction implements Action{

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse resp) {
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		ActionFoward action = new ActionFoward();
		
//		dto.setId(req.getParameter("id"));
//		dto.setPwHint(req.getParameter("pwHint"));
		
		List<String> list = dao.findPw(dto);
		
		req.setAttribute("pwList", list);
		
		action.setPath("./user/findPwView.jsp");
		action.setRedirect(false);
		
		return action;
	}

}
