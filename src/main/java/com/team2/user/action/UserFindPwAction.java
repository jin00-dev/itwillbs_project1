package com.team2.user.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.user.DB.UserDAO;
import com.team2.user.DB.UserDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;

public class UserFindPwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		ActionForward af = new ActionForward();
		
		dto.setId(req.getParameter("id"));
		dto.setPwHint(req.getParameter("pwHint"));
		
		List<String> list = dao.findPw(dto);
		
		req.setAttribute("pwList", list);
		
		af.setPath("./user/findPwView.jsp");
		af.setPathType(false);
		
		return af;
	}

}
