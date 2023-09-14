package com.team2.user.action;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.user.DB.UserDAO;
import com.team2.user.DB.UserDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;


public class UserFindIdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) {
		
			
			UserDAO dao =  new UserDAO();
			UserDTO dto =  new UserDTO();
			
		//	dto.setUser_name(request.getParameter("user_name"));
			dto.setUser_phone(request.getParameter("user_phone"));
			String phone = request.getParameter("user_phone");
		
			UserDTO result = dao.findId(phone);
			response.setContentType("text/html; charset=UTF-8");
			try {
				response.getWriter().print(result.getUser_id());
				System.out.println(result.getUser_id());
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			return null;
			
	}
	}


