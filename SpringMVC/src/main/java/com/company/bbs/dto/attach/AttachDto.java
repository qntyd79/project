package com.company.bbs.dto.attach;

public class AttachDto {

	private int file_idx;
	private String file_name;
	private String file_hash_name;
	private String file_size;
	private String file_type;
	private String file_ext;
	private int download;
	private int hit;
	private int idx;
	private String pass;
	private String title;
	private String content;
	private String cipp;
	private String regdate;
	private String del;
	private int category_idx;
	private int board_idx;

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

	public String getFile_size() {
		return file_size;
	}

	public void setFile_size(String file_size) {
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

	public int getDownload() {
		return download;
	}

	public void setDownload(int download) {
		this.download = download;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
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

	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	@Override
	public String toString() {
		return "AttachDto [file_idx=" + file_idx + ", file_name=" + file_name + ", file_hash_name=" + file_hash_name
				+ ", file_size=" + file_size + ", file_type=" + file_type + ", file_ext=" + file_ext + ", download="
				+ download + ", hit=" + hit + ", idx=" + idx + ", pass=" + pass + ", title=" + title + ", content="
				+ content + ", cipp=" + cipp + ", regdate=" + regdate + ", del=" + del + ", category_idx="
				+ category_idx + " board_idx=" + board_idx + "]";
	}

}
