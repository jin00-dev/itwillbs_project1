package com.team2.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.board.db.ENFBoardDAO;
import com.team2.board.db.ENFBoardDTO;
import com.team2.util.Action;
import com.team2.util.ActionFoward;

public class NoticeBoardAddAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : NoticeBoardAddAction_execute() 호출");
		
		ENFBoardDTO dto = new ENFBoardDTO();
		dto.setCategory((byte) 1);
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		
		ENFBoardDAO dao = new ENFBoardDAO();
		System.out.println(" M : "+dto);
		dao.insertBoard(dto);
		
		ActionFoward forward = new ActionFoward();
		forward.setPath("./noticeMain.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
