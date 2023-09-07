package com.team2.user.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.user.DB.UserDAO;
import com.team2.user.DB.UserDTO;
import com.team2.util.Action;
import com.team2.util.ActionFoward;

public class UserFindIdAction implements Action{

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		UserDAO dao =  new UserDAO();
		UserDTO dto =  new UserDTO();
		
		ActionFoward action = new ActionFoward();
		List<String> list = new ArrayList<String>();
		
//		dto.setIdHint( req.getParameter("idHint") );
		
		list = dao.findId(dto);
		req.setAttribute("idList", list);
		
		action.setPath( "./user/findIdView.jsp");
		action.setRedirect(false);
		
		
		return action;
	}

}
