package com.team2.user.DB;

import java.sql.Date;

public class UserDTO {
	private String id;
	private String pw;
	private String idHint;
	private String pwHint;
	private Date regDate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getIdHint() {
		return idHint;
	}
	public void setIdHint(String idHint) {
		this.idHint = idHint;
	}
	public String getPwHint() {
		return pwHint;
	}
	public void setPwHint(String pwHInt) {
		this.pwHint = pwHInt;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", idHint=" + idHint + ", pwHInt=" + pwHint + ", regDate="
				+ regDate + "]";
	}
	
	
}
