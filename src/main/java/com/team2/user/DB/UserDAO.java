package com.team2.user.DB;

import java.sql.Connection;
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
		sql = "select id from user where id=? and pass=?";
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
			pstmt.setString(1, m.getIdHint());
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
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPwHint());
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
	
	public int join( UserDTO m ) {
		sql = "insert into user values(?,?,?,?,default)";
		
		conn  = con.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId() );
			pstmt.setString(2, m.getPw() );
			pstmt.setString(3, m.getIdHint() );
			pstmt.setString(4, m.getPwHint() );
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
