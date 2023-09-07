package com.team2.user.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.user.DB.UserDAO;
import com.team2.user.DB.UserDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;

public class UserFindIdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		UserDAO dao =  new UserDAO();
		UserDTO dto =  new UserDTO();
		
		ActionForward af = new ActionForward();
		List<String> list = new ArrayList<String>();
		
		dto.setIdHint( req.getParameter("idHint") );
		
		list = dao.findId(dto);
		req.setAttribute("idList", list);
		
		af.setPath( "./user/findIdView.jsp");
		af.setPathType(false);
		
		
		return af;
	}

}
