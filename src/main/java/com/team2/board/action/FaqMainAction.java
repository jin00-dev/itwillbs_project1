package com.team2.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.board.db.ENFBoardDAO;
import com.team2.board.db.ENFBoardDTO;
import com.team2.board.db.QRBoardDTO;
import com.team2.util.Action;
import com.team2.util.ActionFoward;

public class FaqMainAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : faqBoardAction_execute() 호출");
		
		ENFBoardDAO dao = new ENFBoardDAO();
		
		List<ENFBoardDTO> boardList = dao.faqBoardList();
		
		request.setAttribute("boardList", boardList);
		
		ActionFoward forward = new ActionFoward();
		forward.setPath("./faqMain.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
