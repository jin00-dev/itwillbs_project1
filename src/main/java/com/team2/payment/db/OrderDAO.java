package com.team2.payment.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderDAO {
	// 공용변수 선언 // 클래스 안 인스턴스변수(멤버변수)
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	// 메서드 선언 -> 수행하는 동작

	// DB 연결 메서드 - getConnect()

	// 커넥션풀을이용한 getConnect 메서드
	public Connection getConnect() throws Exception {
		System.out.println("DAO : getConnect()실행");
		System.out.println("DAO : 1,2단계를 한번에처리 -> 연결정보 생성");
		System.out.println("DAO : 커넥션풀(CP)을 사용");

		// 디비연결정보 가져오기 (META-INF/context.xml)
		// Context -> 인터페이스 != 클래스 즉 인터페이스 객체생성x
		// 업캐스팅은 가능! 즉 상속관계

		// 프로젝트 정보 초기화
		Context initCTX = new InitialContext();

		// context.xml 파일(jdbc/jsp 이름)접근
		// DataSource 타입으로 변경
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/t2");

		// 연결정보 객체를 사용해서 디비 연결
		con = ds.getConnection();

		return con;
	}

	// DB 자원해제 메서드 - closeDB()
	// DB 작업시 필수 동작
	public void closeDB() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
			System.out.println("DAO : 자원해제 완료");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<CinemaDTO> getCinema(String region1, String region2) {

		// 극장리스트 저장하는객체
		List<CinemaDTO> cinemaList = new ArrayList<CinemaDTO>();
		String str = region1 + "|" + region2;
		System.out.println("str: " + str);
		try {
			con = getConnect();
			sql = "select cinema_name from cinema where regexp_like(region, ?); ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CinemaDTO dto = new CinemaDTO();
				dto.setCinema_name(rs.getString(1));
				cinemaList.add(dto);
			}
			System.out.println("DAO : 리스트사이즈 : " + cinemaList.size());

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return cinemaList;
	}

	public List<ScreenDTO> getMovieName(String thaeter) {
		
		List<ScreenDTO> movieList = new ArrayList<ScreenDTO>();
		try {
			con = getConnect();
			sql = "select distinct movie_name from screening where cinema_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, thaeter);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ScreenDTO dto = new ScreenDTO();
				dto.setMovie_name(rs.getString(1));
				movieList.add(dto);
			}
			System.out.println("DAO 리스트사이즈 : "+movieList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return movieList;
	}
	


	
	public List<ScreenDTO> getMovieTime(String movie, String theater) {
		
		List<ScreenDTO> mTimeList = new ArrayList<>();
		
		try {
			con = getConnect();
			sql = "select screening_time from screening where movie_name=? and cinema_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, movie);
			pstmt.setString(2, theater);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ScreenDTO dto = new ScreenDTO();
				dto.setScreening_time(rs.getString(1));
				mTimeList.add(dto);
				System.out.println("DAO 영화상영시간 : "+rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		
		return mTimeList;
	}
	
	// 극장에 해당하는 지역 출력 메서드
	public CinemaDTO getRegion(String cinema) {
		System.out.println("DAO cinema : "+cinema);
		CinemaDTO dto = new CinemaDTO();
		try {
			con = getConnect();
			sql = "select region from cinema where cinema_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cinema);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setRegion(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// 상영관의 팔린 좌석 출력 메서드
	public List<OrderDTO> getSeat(String cinema, String time) {
		List<OrderDTO> list = new ArrayList<>();
		OrderDTO dto = new OrderDTO();
		try {
			con = getConnect();
			String sTime = "%"+time+"%";
			sql = "select seat from order_board where cinema_name=? and screening_time like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cinema);
			pstmt.setString(2, sTime);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setSeat(rs.getString(1));
				list.add(dto);
				System.out.println("DAO 팔린좌석 : "+rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

}
