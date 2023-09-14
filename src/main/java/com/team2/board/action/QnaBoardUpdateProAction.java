package com.team2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.board.db.QRBoardDAO;
import com.team2.board.db.QRBoardDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;

public class QnaBoardUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	System.out.println(" M : BoardUpdateProAction_execute 호출 ");
		
		String pageNum = request.getParameter("pageNum");
		
		// 전달정보 저장(수정할 데이터)
		QRBoardDTO dto = new QRBoardDTO();
		
		dto.setQna_bno(Integer.parseInt(request.getParameter("qna_bno")));
		int qna_bno =  dto.getQna_bno();
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setAnswer((byte) Integer.parseInt(request.getParameter("answer")));
		dto.setAnswer_context(request.getParameter("answer_context"));
		// DAO - 정보수정메서드 호출
		QRBoardDAO dao = new QRBoardDAO();
		dao.updateBoard(dto);
				
		// request 영역에 정보 저장
		request.setAttribute("dto", dto);
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./qnaBoardContent.bo?pageNum="+pageNum+"&&qna_bno="+qna_bno);
		forward.setRedirect(true);
				
		return forward;
	
	}

}
