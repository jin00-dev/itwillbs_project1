package com.team2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.board.db.ENFBoardDAO;
import com.team2.board.db.ENFBoardDTO;
import com.team2.board.db.QRBoardDAO;
import com.team2.board.db.QRBoardDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;

public class NoticeBoardUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	System.out.println(" M : BoardUpdateProAction_execute 호출 ");
		
		String pageNum = request.getParameter("pageNum");
		
		// 전달정보 저장(수정할 데이터)
		ENFBoardDTO dto = new ENFBoardDTO();
		dto.setCategory((byte) 1);
		dto.setNotice_bno(Integer.parseInt(request.getParameter("notice_bno")));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		// DAO - 정보수정메서드 호출
		ENFBoardDAO dao = new ENFBoardDAO();
		dao.updateBoard(dto);
				
		// request 영역에 정보 저장
		request.setAttribute("dto", dto);
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./noticeMain.bo?pageNum="+pageNum);
		forward.setRedirect(true);
				
		return forward;
	
	}

}
