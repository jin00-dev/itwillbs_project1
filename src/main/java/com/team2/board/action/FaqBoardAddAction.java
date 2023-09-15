package com.team2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.board.db.ENFBoardDAO;
import com.team2.board.db.ENFBoardDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;

public class FaqBoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : faqBoardAddAction_execute() 호출");
		
		ENFBoardDTO dto = new ENFBoardDTO();
		dto.setCategory((byte) 2);
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		
		ENFBoardDAO dao = new ENFBoardDAO();
		System.out.println(" M : "+dto);
		dao.insertBoard(dto);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./faqMain.bo");
		forward.setRedirect(true);
		return forward;
	}

}
