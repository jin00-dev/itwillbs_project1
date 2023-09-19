package com.team2.user.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.user.DB.UserDAO;
import com.team2.user.DB.UserDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;

public class AdminUserInfoBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		UserDAO dao = new UserDAO();
		
		int bCount = dao.userListCount();
		String search = req.getParameter("search");

		// 페이징처리-1 => Model
		//////////////////////// 페이징처리-1//////////////////////////

		// 페이지당 출력할 글의 개수
		int pageSize = 5; // 한페이지에 10개씩 출력

		// 페이지의 정보(몇페이지 인지 확인하는 정보)
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1"; // 페이지 정보가 없을경우 1페이지로 고정(기본값)
		}

		// 시작행 번호 계산 1 11 21 31 ....
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝행 번호 계산 10 20 30 40 ...
		int endRow = currentPage * pageSize;

		//////////////////////// 페이징처리-1//////////////////////////
		List<UserDTO> list = new ArrayList<>();
		if (search == null || search.equals("")) {
			list = dao.getAllUserInfo(startRow, pageSize);
			req.setAttribute("list", list);
		}else {
			if(dao.getAllUserInfo(search)!=null) {
				list.add(dao.getAllUserInfo(search));
				req.setAttribute("list", list);
			}
		}

		// 페이징 처리 -2 => Model

		// 전체 페이지 수 => 글 / 페이지당 출력 개수
		// 50 / 10 => 5 55 / 10 => 6
		int pageCount = bCount / pageSize + (bCount % pageSize != 0 ? 1 : 0);

		// 한 화면에서 보여줄 페이지번호 개수(block) 1....10
		int pageBlock = 4;

		// 페이지 블럭의 시작번호 1~10 => 1 11~20 => 11 21~30 => 21
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;

		// 페이지 블럭의 끝 번호 1~10 => 10 11~20 => 20 21~30 => 30
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		
		
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("count", bCount);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("startRow", startRow);
		req.setAttribute("pageSize", pageSize);

		ActionForward af = new ActionForward();
		af.setPath("./user/admin_userInfo.jsp");
		af.setRedirect(false);
		
		return af;
	}

}