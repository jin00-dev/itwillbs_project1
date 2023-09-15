package com.team2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.board.db.ENFBoardDAO;
import com.team2.board.db.ENFBoardDTO;
import com.team2.board.db.QRBoardDAO;
import com.team2.board.db.QRBoardDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;
import com.team2.util.JSMethod;

public class NoticeBoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : NoticeBoardDeleteAction_execute 호출 "); 
		
		// 전달정보 저장(bno,pass,pageNum)
		ENFBoardDTO dto = new ENFBoardDTO();
		dto.setCategory((byte) 1);
		dto.setNotice_bno(Integer.parseInt(request.getParameter("notice_bno")));
		System.out.println("qna_bno : "+dto.getNotice_bno());
				
		// DAO - 글 삭제 메서드() 
		ENFBoardDAO dao = new ENFBoardDAO();
		dao.deleteBoard(dto);

		JSMethod.alertDelete(response, "삭제 완료!");
		
		
		return null;
	}

}
