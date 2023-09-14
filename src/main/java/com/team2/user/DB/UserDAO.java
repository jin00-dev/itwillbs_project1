package com.team2.user.DB;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team2.util.ConnectionDB;

public class UserDAO {
	ConnectionDB con = new ConnectionDB();
	PreparedStatement pstmt;
	Connection conn;
	ResultSet rs;
	String sql;
	
	public int rogin( String id, String pw ) {
		sql = "select user_id from user where user_id=? and user_pass=?";
		try {
			conn = con.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.executeQuery();
			
			return 1;
			
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally {
			con.closeDB(conn, rs, pstmt);
		}
	}
	
	public List<String> findId( UserDTO m ) {
		sql = "select id from user where id_hint = ?";
		List<String> list = new ArrayList<>(); 
		
		try {
			conn = con.getConnection();
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, m.getIdHint());
			rs = pstmt.executeQuery();
			
			list = new ArrayList<String>();
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}

			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			con.closeDB(conn, rs, pstmt);
		}
		
	}
	
	public List<String> findPw( UserDTO m ) {
		sql = "select pw from user where id = ? and pw_hint =?";
		List<String> list = null;
		
		try {
			conn = con.getConnection();
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, m.getId());
//			pstmt.setString(2, m.getPwHint());
			rs = pstmt.executeQuery();
			
			list = new ArrayList<String>();
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			
			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			con.closeDB(conn, rs, pstmt);
		}
	}
	
	//회원가입
	public int join( UserDTO m , String is ) {
		sql 
		= "insert into user (user_id,user_name,user_pass,user_phone,user_regdate,last_access,user_type) values(?,?,?,?,default,default,0)";
		
		conn  = con.getConnection();
		if(!is.equals("true")) {
			return 0;
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUser_id() );
			pstmt.setString(2, m.getUser_name() );
			pstmt.setString(3, m.getUser_pass() );
			pstmt.setString(4, m.getUser_phone() );
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			con.closeDB(conn, rs, pstmt);
		}
		
	}
	
	//아이디 중복 확인
	public boolean checkId(String id) {
		
		sql = "select count(*) from user where user_id=?";
		conn  = con.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id );
			rs =  pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt(1) >0) {
					return false; //아이디가 이미 존재함
				}else {
					return true; //아이디 사용 가능
				}
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			con.closeDB(conn, rs, pstmt);
		}
	}
	
	//아이디 찾기 findId()

	public UserDTO findId(String phone) {
		UserDTO dto = new UserDTO();
		sql = "select user_id from user where user_phone=?";
		conn  = con.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phone );
			rs =  pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setUser_id(rs.getString(1));
			}
				
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			con.closeDB(conn, rs, pstmt);}
	return dto;
	}
	
	
	//아이디 찾기 findId()
	
	// 비밀번호 찾기 findPw()
	
	public UserDTO findPw(String phone) {
		UserDTO dto = new UserDTO();
		sql = "select user_pass from user where user_phone";
		conn = con.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, phone);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setUser_pass(rs.getString(1));
			}
		
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			con.closeDB(conn, rs, pstmt);}
		return dto;
		}
	
	//비밀번호 찾기 findPw()
	
	//회원정보 삭제
	public int UserDelete(String id,String pw) {
		int result = -1;
		
		try {
			//1.2. 디비연결
			conn = con.getConnection();
			//3. sql 작성(select) & pstmt 객체
			sql = "select user_pass from user where user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			//4. sql 실행
			rs = pstmt.executeQuery();
			//5. 데이터 처리
			if(rs.next()) {
				// 회원
				if(pw.equals(rs.getString("pw"))) {
					// 비밀번호 O
					//3. sql 작성(delete) & pstmt 객체
					sql = "delete from user where user_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					
					//4. sql 실행
					result = pstmt.executeUpdate();
					// result = 1;
				}else {
					// 비밀번호 X  0
					result = 0;
				}
			}else {
				// 비회원 -1
				result = -1;
			}
			
			System.out.println(" DAO : 정보수정완료 "+result);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.closeDB(conn, rs, pstmt);
		}
		
		
		return result;		
	}
	
	//회원정보 삭제
	
}
