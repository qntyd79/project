package com.company.bbs.vo.email;

public class Emaild {
	
	private String tomail;
	private String sendmail;
	private String title;
	private String content;
	
	public String getTomail() {
		return tomail;
	}
	public void setTomail(String tomail) {
		this.tomail = tomail;
	}
	public String getSendmail() {
		return sendmail;
	}
	public void setSendmail(String sendmail) {
		this.sendmail = sendmail;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "EmailVo [tomail=" + tomail + ", sendmail=" + sendmail + ", title=" + title + ", content=" + content
				+ "]";
	}

}
