package com.company.bbs.vo.email;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

import com.company.bbs.vo.attach.AttachVO;

public class EmailVO extends AttachVO {	
	
	private int email_idx;
	private String userid;	
	private String pass;
	private String toemail;
	private String sendemail;
	private String title;
	private String content;
	private int hit;
	private String cipp;
	private String regdate;
	private String del;
	private int category_idx;
	private MultipartFile[] attach;

	public int getEmail_idx() {
		return email_idx;
	}

	public void setEmail_idx(int email_idx) {
		this.email_idx = email_idx;
	}

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

	public String getToemail() {
		return toemail;
	}

	public void setToemail(String toemail) {
		this.toemail = toemail;
	}

	public String getSendemail() {
		return sendemail;
	}

	public void setSendemail(String sendemail) {
		this.sendemail = sendemail;
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getCipp() {
		return cipp;
	}

	public void setCipp(String cipp) {
		this.cipp = cipp;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}
	public MultipartFile[] getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile[] attach) {
		this.attach = attach;
	}

	@Override
	public String toString() {
		return "EmailVO [email_idx=" + email_idx + ", userid=" + userid + ", pass=" + pass + ", toemail=" + toemail
				+ ", sendemail=" + sendemail + ", title=" + title + ", content=" + content + ", hit=" + hit + ", cipp="
				+ cipp + ", regdate=" + regdate + ", del=" + del + ", category_idx=" + category_idx + ", attach="
				+ Arrays.toString(attach) + "]";
	}
	
	
	

	
}
