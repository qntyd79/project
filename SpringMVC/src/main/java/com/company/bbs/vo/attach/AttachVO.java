package com.company.bbs.vo.attach;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class AttachVO {

	private int file_idx;
	private String file_name;
	private String file_hash_name;
	private long file_size;
	private String file_type;
	private String file_ext;
	private int file_index;	
	private int download;	
	private MultipartFile[] attach;		
	private String regdate;
	private String del;
	private int board_idx;
	private int member_idx;
	
	public int getFile_idx() {
		return file_idx;
	}
	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_hash_name() {
		return file_hash_name;
	}
	public void setFile_hash_name(String file_hash_name) {
		this.file_hash_name = file_hash_name;
	}
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public String getFile_ext() {
		return file_ext;
	}
	public void setFile_ext(String file_ext) {
		this.file_ext = file_ext;
	}
	public int getFile_index() {
		return file_index;
	}
	public void setFile_index(int file_index) {
		this.file_index = file_index;
	}
	public MultipartFile[] getAttach() {
		return attach;
	}
	public void setAttach(MultipartFile[] attach) {
		this.attach = attach;
	}
	public int getDownload() {
		return download;
	}
	public void setDownload(int download) {
		this.download = download;
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
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	
	@Override
	public String toString() {
		return "AttachVO [file_idx=" + file_idx + ", file_name=" + file_name + ", file_hash_name=" + file_hash_name
				+ ", file_size=" + file_size + ", file_type=" + file_type + ", file_ext=" + file_ext + ", file_index="
				+ file_index + ", download=" + download + ", attach=" + Arrays.toString(attach) + ", regdate=" + regdate
				+ ", del=" + del + ", board_idx=" + board_idx + ", member_idx=" + member_idx + "]";
	}
	
	
	
	
		
}
