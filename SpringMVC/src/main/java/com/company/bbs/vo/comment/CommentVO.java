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
	private int vote;
	private String regdate;
	private String del;
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
	public int getVote() {
		return vote;
	}
	public void setVote(int vote) {
		this.vote = vote;
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
	
	@Override
	public String toString() {
		return "CommentVO [comment_idx=" + comment_idx + ", parent=" + parent + ", depth=" + depth + ", sortno="
				+ sortno + ", userid=" + userid + ", name=" + name + ", pass=" + pass + ", email=" + email
				+ ", content=" + content + ", hit=" + hit + ", cipp=" + cipp + ", vote=" + vote + ", regdate=" + regdate
				+ ", del=" + del + ", board_idx="
				+ board_idx + "]";
	}
		

}
