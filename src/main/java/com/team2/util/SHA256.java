package com.team2.util;

import java.security.MessageDigest;

public class SHA256 {
	
	private static String Salt ="햄버거좋아"; //임시 소금 
	public String encodSha256(String source) {
		
		String result ="";
		
		byte[] a = source.getBytes();// 소스를 바이트로 변경 
		byte[] salt = Salt.getBytes();
		byte[] bytes = new byte[a.length+salt.length];
		
		System.arraycopy(a, 0, bytes, 0, a.length);
		System.arraycopy(salt, 0, bytes, 0, salt.length);
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(bytes);
			
			byte[] byteData = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(int i=0; i<byteData.length; i++) {
				sb.append(Integer.toString((byteData[i]&0xFF) +256, 16).substring(1));

				
			}
			result = sb.toString();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
 		
	};

	

}
