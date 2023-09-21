package com.team2.payment.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


import com.team2.payment.db.OrderDAO;
import com.team2.payment.db.ScreenDTO;
import com.team2.util.Action;
import com.team2.util.ActionForward;

public class MovieAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : MovieAtcion() 호출");
		
		// 영화이름 -> 상영시간 출력
		
		String movie = request.getParameter("movie");
		String theater = request.getParameter("theater");
		
		OrderDAO dao = new OrderDAO();
		List<ScreenDTO> mTimeList = dao.getMovieTime(movie, theater);
		
		JSONArray arrayTime = new JSONArray();
		
		for(int i=0;i<mTimeList.size();i++) {
			JSONObject obj = new JSONObject();
			obj.put("movieTime", mTimeList.get(i).getScreening_time());
			arrayTime.add(obj);
			System.out.println("M 영화상영시간 : "+mTimeList.get(i).getScreening_time());
		}
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(arrayTime);
		
		System.out.println("M : mTimeList 사이즈 : "+mTimeList.size());
		
		
		
		return null;
	}

}
