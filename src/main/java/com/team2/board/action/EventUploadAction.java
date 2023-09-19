package com.team2.board.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team2.board.db.ENFBoardDAO;
import com.team2.board.db.ENFBoardDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;
import com.team2.util.JSMethod;

public class EventUploadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String location = request.getServletContext().getRealPath("/img"); // 실제저장되는경로
//		String location = request.getRealPath("/img"); // 실제저장되는경로
//		String location = "C:\\Users\\ITWILL\\git\\team2\\src\\main\\webapp\\img"; // 실제저장되는경로
//		String location = request.getSession().getServletContext().getRealPath("/evt_img");
//		String location = "/image"; // 실제저장되는경로
		
		System.out.println("location : "+location);
		int maxSize = 1024 * 1024 * 10; // 키로바이트 * 메가바이트 * 기가바이트   
//		HttpSession session = request.getSession();
		MultipartRequest multi = new MultipartRequest(request,
							 						  location,
													  maxSize,
													  "utf-8",
													  new DefaultFileRenamePolicy());
		Enumeration<?> files = multi.getFileNames();
		String element = "";
		String filesystemName = "";
//		String originalFileName = "";
//		String contentType = "";
				
		if (files.hasMoreElements()) { 
			
			element = (String)files.nextElement(); 
			
			filesystemName 			= multi.getFilesystemName(element); 
//			originalFileName 		= multi.getOriginalFileName(element); 
//			contentType 			= multi.getContentType(element);	
			
		}
		ENFBoardDAO dao = new ENFBoardDAO();
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		ENFBoardDTO dto = new ENFBoardDTO();
		dto.setCategory((byte) 0);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setImg(filesystemName);
//		int max = dao.getBoardCountMax((byte) 0);
		dao.insertBoard(dto);
		
		request.setAttribute("subject", subject);
//		session.setAttribute("subject", subject);
		request.setAttribute("content", content);
//		session.setAttribute("content", content);
		request.setAttribute("fileName", filesystemName);
//		session.setAttribute("fileName", filesystemName);
		System.out.println("fileName : "+filesystemName);
//		request.setAttribute("contentType", contentType);
//		System.out.println("contentType : "+contentType);
//		request.setAttribute("max", max);
//		session.setAttribute("max", max);
		
		JSMethod.alertLocation(response, "등록 완료!");
		
		return null;
	}

}
