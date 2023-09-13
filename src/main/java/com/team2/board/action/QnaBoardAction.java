package com.team2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.board.db.ENFBoardDAO;
import com.team2.board.db.ENFBoardDTO;
import com.team2.board.db.QRBoardDAO;
import com.team2.board.db.QRBoardDTO;
import com.team2.util.Action;
import com.team2.util.ActionFoward;

public class QnaBoardAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M :QnaBoardAction_execute() 호출");
		
		// 한글처리(생략) -> web.xml에 필터적용해서
		
		// 글정보 저장 => DTO
		QRBoardDTO dto = new QRBoardDTO();
		dto.setCategory((byte) 0);
//		dto.setUser_id(request.getParameter("user_id"));
		dto.setUser_id("7");
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		
		System.out.println(" M : "+dto);
		
		// DB연결 -> DAO 객체 - 글쓰기 메서드
		QRBoardDAO dao = new QRBoardDAO();
		dao.insertBoard(dto);
	
		return null; // 정보만보내고 화면끔
	}

}
