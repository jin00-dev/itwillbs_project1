package com.t2.util;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 인터페이스 : 객체생성x, 참조변수타입 지정o, 구현
 * 	-> 상수, 추상메서드, static메서드, default메서드
 * 
 * 인터페이스 안에 있는 추상메서드 사용 바법 -> 상속-오버라이딩(강제성)
 * 
 * 
 */

public interface Action {
	
	// 메서드 인터페이스는 abstract 생략됨 - 알아서 추상메서드로 인식
	// execute() 실행되면 ActionForward 객체가 리턴된다. 반환타입 : ActionForward
	public /* abstract */ ActionForward execute(HttpServletRequest request,
												HttpServletResponse response) throws Exception;
}
