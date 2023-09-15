package com.t2.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.t2.db.CinemaDTO;
import com.t2.db.OrderDAO;
import com.t2.db.OrderDTO;
import com.t2.util.Action;
import com.t2.util.ActionForward;

import netscape.javascript.JSObject;

public class SeatPaymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : seatPaymentAction() 호출");	
		
		// 전달정보 저장
		String cinema = request.getParameter("theater");
		System.out.println(" M : cinema : "+cinema);
		String movie = request.getParameter("movie");
		String time = request.getParameter("time");
		String car_num = request.getParameter("car_num");
		String car_type = request.getParameter("car_type");
		
		// 극장에 해당하는 지역 theaterDB		-  (결제후 order_board 업데이트를위해 지역을 가져온다)
		OrderDAO dao = new OrderDAO();
		CinemaDTO dto = dao.getRegion(cinema);
		
		System.out.println(" M : 지역 : "+dto.getRegion());
		
		// 상영관의 남은좌석 order_boardDB
		List<OrderDTO> seatList = dao.getSeat(cinema, time);
		
		// List -> JSONArray 담아서 전달 / dto -> JSONObject 전달
		JSONArray seList = new JSONArray();
		
		for(int i=0;i<seatList.size();i++) {
			JSONObject obj = new JSONObject();
			obj.put("seat", seatList.get(i).getSeat());
			seList.add(obj);
		}
		
		JSONObject obj2 = new JSONObject();
		obj2.put("region", dto.getRegion());
		
		
		// 상영관, 영화, 영화상영시간, 차번호, 차타입, 팔린좌석, 지역 (json저장 -> jsp전달)
			
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(seList);
		response.getWriter().print(obj2);
		response.getWriter().print(cinema);
		response.getWriter().print(movie);
		response.getWriter().print(time);
		response.getWriter().print(car_num);
		response.getWriter().print(car_type);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./seatPayment.or");
		forward.setRedirect(true);
		
		return forward;
	}

}
