package com.t2.util;

/**
 * 
 * ActionForward : 페이지 이동에 필요한 정보를 저장하는 객체
 * (기차표) MVC에서 페이지이동을위해선 기차표(ActionForward)가있어야 이동이가능. 
 *
 */

public class ActionForward {
	private String path; // 이동할 페이지 주소(목적지)
	private boolean isRedirect; // 이동 방식(직행, 환승)
	// 이동방식 - true : sendRedirect()
	//					화면변경, 주소변경 (.me -> .me ) 가상주소끼리 변경
	//		    - false : forward()
	// 					화면변경, 주소변경x (.me -> jsp ) 실제페이지 이동
	// 					(+ Action클래스에서 request 영역에 저장)
	
	// alt + shift + s + r
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	// alt + shift + s + s 
	@Override
	public String toString() {
		return "ActionForward(기차표) [path(목적지)=" + path + ", isRedirect(이동 방식)=" + isRedirect + "]";
	}
	
	
}
