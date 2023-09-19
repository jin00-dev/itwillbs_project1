package com.team2.board.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.board.db.ENFBoardDAO;
import com.team2.board.db.ENFBoardDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;
import com.team2.util.JSMethod;

public class ENFBoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : NoticeBoardAddAction_execute() 호출");
		
		ENFBoardDTO dto = new ENFBoardDTO();
		dto.setCategory((byte) Integer.parseInt(request.getParameter("category")));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		
		ENFBoardDAO dao = new ENFBoardDAO();
		System.out.println(" M : "+dto);
		dao.insertBoard(dto);
		
		JSMethod.alertLocation(response, "추가 완료!");
		
		return null;
	}

}
