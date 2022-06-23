package com.company.bbs.vo.board;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.category.CategoryVO;
import com.company.bbs.vo.member.MemberVO;

public class BoardVO extends AttachVO {

	private int board_idx;
	private int parent;
	private int depth;
	private int sortno;
	private String userid;
	private String name;
	private String pass;
	private String email;
	private String homepage;
	private String link1;
	private String link2;
	private String title;
	private String content;
	private int hit;
	private String cipp;
	private int tag;
	private int secret;
	private int notice;
	private int vote;
	private String sdate;
	private String edate;
	private String regdate;
	private String del;
	private int category_idx;
	private int comment_idx;
	private int file_idx;
	private int member_idx;
	private MultipartFile[] attach;
	private int filecnt;
	private int commentcnt;
	private CategoryVO categoryVO; //카테고리테이블 조인용
	
	public int getCommentcnt() {
		return commentcnt;
	}

	public void setCommentcnt(int commentcnt) {
		this.commentcnt = commentcnt;
	}

	public int getFilecnt() {
		return filecnt;
	}

	public void setFilecnt(int filecnt) {
		this.filecnt = filecnt;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
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

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getLink1() {
		return link1;
	}

	public void setLink1(String link1) {
		this.link1 = link1;
	}

	public String getLink2() {
		return link2;
	}

	public void setLink2(String link2) {
		this.link2 = link2;
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

	public int getTag() {
		return tag;
	}

	public void setTag(int tag) {
		this.tag = tag;
	}

	public int getSecret() {
		return secret;
	}

	public void setSecret(int secret) {
		this.secret = secret;
	}

	public int getNotice() {
		return notice;
	}

	public void setNotice(int notice) {
		this.notice = notice;
	}

	public int getVote() {
		return vote;
	}

	public void setVote(int vote) {
		this.vote = vote;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
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

	public int getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}

	public int getFile_idx() {
		return file_idx;
	}

	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	

	public MultipartFile[] getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile[] attach) {
		this.attach = attach;
	}
	
	public CategoryVO getCategoryVO() {
		return categoryVO;
	}
	public void setCategoryVO(CategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}
	
	@Override
	public String toString() {
		return "BoardVO [board_idx=" + board_idx + ", parent=" + parent + ", depth=" + depth + ", sortno=" + sortno
				+ ", userid=" + userid + ", name=" + name + ", pass=" + pass + ", email=" + email + ", homepage="
				+ homepage + ", link1=" + link1 + ", link2=" + link2 + ", title=" + title + ", content=" + content
				+ ", hit=" + hit + ", cipp=" + cipp + ", tag=" + tag + ", secret=" + secret + ", notice=" + notice
				+ ", vote=" + vote + ", sdate=" + sdate + ", edate=" + edate + ", regdate=" + regdate + ", del=" + del
				+ ", category_idx=" + category_idx + ", comment_idx=" + comment_idx + ", file_idx=" + file_idx
				+ ", member_idx=" + member_idx + ", attach=" + Arrays.toString(attach) + ", filecnt=" + filecnt
				+ ", commentcnt=" + commentcnt + "]";
	}

	
	

}
