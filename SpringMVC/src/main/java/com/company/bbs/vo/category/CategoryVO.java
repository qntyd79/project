package com.company.bbs.vo.category;

public class CategoryVO {
	
	private int category_idx;
	private int parent;
	private int depth;
	private int sortno;
	private String title;
	private String name;
	private String pass;
	private int hit;
	private int total;
	private int kind;
	private String cipp;
	private String regdate;
	private String del;
	private int board_idx;	
	private int member_idx;	

	public int getCategory_idx() {
		return category_idx;
	}
	
	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
	
	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	public int getTotal() {
		return total;
	}
	
	public void setTotal(int total) {
		this.total = total;
	}
	
	public int getKind() {
		return kind;
	}
	
	public void setKind(int kind) {
		this.kind = kind;
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
		return "CategoryDto [category_idx=" + category_idx + ", parent=" + parent + ", depth=" + depth + ", sortno="
				+ sortno + ", title=" + title + ", name=" + name + ", pass=" + pass + ", hit=" + hit + ", total="
				+ total + ", kind=" + kind + ", cipp=" + cipp + ", regdate=" + regdate + ", del=" + del + ", board_idx="
				+ board_idx +", member_idx=" + member_idx + "]";
	}
	
	
}
