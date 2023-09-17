package com.team2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.board.db.ENFBoardDAO;
import com.team2.board.db.ENFBoardDTO;
import com.team2.board.db.QRBoardDAO;
import com.team2.board.db.QRBoardDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;

public class ENFBoardUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : NoticeBoardUpdateAction_execute() 호출");
		
		// 전달정보 저장(bno,pageNum)
		int event_bno = 0;
		int notice_bno = 0;
		int faq_bno = 0;
		Byte categroy = (byte) Integer.parseInt(request.getParameter("category"));
		if(categroy == 0) {
			event_bno = Integer.parseInt(request.getParameter("event_bno"));
		}else if(categroy == 1) {
			notice_bno = Integer.parseInt(request.getParameter("notice_bno"));
		}else{
			faq_bno = Integer.parseInt(request.getParameter("faq_bno"));
		}
		String pageNum = request.getParameter("pageNum");
		
		// DAO - 특정글 정보 조회
		ENFBoardDAO dao = new ENFBoardDAO();
		ENFBoardDTO dto = null; 
		if(categroy == 0) {
			dto = dao.getBoard(categroy,event_bno);						
		}else if(categroy == 1){
			dto = dao.getBoard(categroy,notice_bno);			
		}else {
			dto =dao.getBoard(categroy, faq_bno);
		}
		
		// request 영역 저장
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		if(categroy == 0) {
			forward.setPath("./eventUpdate.jsp");
		}else if(categroy == 1) {
			forward.setPath("./noticeBoardUpdate.jsp");
		}else {
			forward.setPath("./faqBoardUpdate.jsp");			
		}
		forward.setRedirect(false);		
		
		return forward;
	}
}
