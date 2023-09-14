package com.team2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.board.db.ENFBoardDAO;
import com.team2.board.db.ENFBoardDTO;
import com.team2.board.db.QRBoardDAO;
import com.team2.board.db.QRBoardDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;

public class NoticeBoardUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : NoticeBoardUpdateAction_execute() 호출");
		
		// 전달정보 저장(bno,pageNum)
		int notice_bno = Integer.parseInt(request.getParameter("notice_bno"));
		String pageNum = request.getParameter("pageNum");
		
		// DAO - 특정글 정보 조회
		ENFBoardDAO dao = new ENFBoardDAO();
		ENFBoardDTO dto = dao.getBoard((byte) 1,notice_bno);
		
		// request 영역 저장
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./noticeBoardUpdate.jsp");
		forward.setRedirect(false);		
		
		return forward;
	}
}
