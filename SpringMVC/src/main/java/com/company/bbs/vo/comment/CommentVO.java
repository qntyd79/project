package com.company.bbs.vo.comment;

public class CommentVO {

	private int comment_idx;
	private int parent;
	private int depth;
	private int sortno;
	private String userid;
	private String name;
	private String pass;
	private String email;
	private String content;
	private int hit;
	private String cipp;
	private String regdate;
	private String del;
	private int category_idx;
	private int member_idx;
	private int board_idx;
	
	public int getComment_idx() {
		return comment_idx;
	}
	
	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}
	
	public int getParent() {
		return parent;
	}
	
	public void setParent(int parent) {
		this.parent = parent;
	}
	
	public int getDepth() {
		return depth;
	}
	
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	public int getSortno() {
		return sortno;
	}
	
	public void setSortno(int sortno) {
		this.sortno = sortno;
	}
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPass() {
		return pass;
	}
	
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
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
	
	public int getMember_idx() {
		return member_idx;
	}
	
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	
	public int getBoard_idx() {
		return board_idx;
	}
	
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	
	@Override
	public String toString() {
		return "CommentDto [comment_idx=" + comment_idx + ", parent=" + parent + ", depth=" + depth + ", sortno="
				+ sortno + ", userid=" + userid + ", name=" + name + ", pass=" + pass + ", email=" + email
				+ ", content=" + content + ", hit=" + hit + ", cipp=" + cipp + ", regdate=" + regdate + ", del=" + del
				+ ", category_idx=" + category_idx + ", member_idx=" + member_idx + ", board_idx=" + board_idx + "]";
	}	

}
