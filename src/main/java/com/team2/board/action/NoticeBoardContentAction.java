package com.team2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.board.db.ENFBoardDAO;
import com.team2.board.db.ENFBoardDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;

public class NoticeBoardContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : NoticeBoardContentAction_execute() 호출");
		
		// 전달정보 저장 bno, pageNum
		int notice_bno = Integer.parseInt(request.getParameter("notice_bno"));
		String pageNum = request.getParameter("pageNum");
		
		// DAO - 조회수 1증가()
		ENFBoardDAO dao = new ENFBoardDAO();
		dao.updateRead_count((byte) 1,notice_bno);
		System.out.println(" M : 조회수 1 증가!");
		
		// DAO - 특정글 정보 조회()
		ENFBoardDTO dto = dao.getBoard((byte) 1,notice_bno);
		
		// request 영역에 정보 저장
		request.setAttribute("dto", dto);
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./noticeBoardContent.jsp?pageNum="+pageNum);
		forward.setRedirect(false);
		
		return forward;
	}

}
