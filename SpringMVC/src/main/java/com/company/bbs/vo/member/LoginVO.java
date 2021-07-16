package com.company.bbs.vo.member;

public class LoginVO {
	
	private String userid;	
	private String pass;
	private boolean usecookie;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public boolean isUsecookie() {
		return usecookie;
	}
	public void setUsecookie(boolean usecookie) {
		this.usecookie = usecookie;
	}
	
	@Override
	public String toString() {
		return "LoginVO [userid=" + userid + ", pass=" + pass + ", usecookie=" + usecookie + "]";
	}
	
	
	
	
}
