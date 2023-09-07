package com.team2.util;

public class ActionFoward {
	private String path;
	private boolean pathType;
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isPathType() {
		return pathType;
	}
	public void setPathType(boolean pathType) {
		this.pathType = pathType;
	}
	
	@Override
	public String toString() {
		return "ActionFoward [path=" + path + ", pathType=" + pathType + "]";
	}
	
	
}
