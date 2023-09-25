package com.team2.user.DB;

public class NonuserDTO {
	private int nonuser_id;
	private String nonuser_name;
	private String nonuser_pass;
	private String nonuser_phone;
	
	public int getNonuser_id() {
		return nonuser_id;
	}
	public void setNonuser_id(int nonuser_id) {
		this.nonuser_id = nonuser_id;
	}
	public String getNonuser_name() {
		return nonuser_name;
	}
	public void setNonuser_name(String nonuser_name) {
		this.nonuser_name = nonuser_name;
	}
	public String getNonuser_pass() {
		return nonuser_pass;
	}
	public void setNonuser_pass(String nonuser_pass) {
		this.nonuser_pass = nonuser_pass;
	}
	public String getNonuser_phone() {
		return nonuser_phone;
	}
	public void setNonuser_phone(String nonuser_phone) {
		this.nonuser_phone = nonuser_phone;
	}
	
	@Override
	public String toString() {
		return super.toString();
	}
}
