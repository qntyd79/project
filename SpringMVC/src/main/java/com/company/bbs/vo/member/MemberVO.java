package com.company.bbs.vo.member;

public class MemberVO {
	
	private int member_idx;
	private String userid;	
	private String pass;
	private String pass_ask;
	private String pass_account;
	private String name;
	private String nickname;
	private String email;
	private String email2;
	private String homepage;
	private String zipcode;
	private String address;
	private String detailaddress;
	private String extraaddress;
	private String phone;
	private String hphone;
	private String job;
	private String attach;
	private String message;
	private String etc;
	private int mail_check;
	private int level;
	private int point;
	private int approval;
	private String join_date;
	private String login_last;
	private int login_cnt;
	private String login_ip;
	private int user_leave;
	private String cipp;
	private String regdate;
	private String del;
	private int category_idx;
	
	@Override
	public String toString() {
		return "MemberDto [member_idx=" + member_idx + ", userid=" + userid + ", pass=" + pass + ", pass_ask="
				+ pass_ask + ", pass_account=" + pass_account + ", name=" + name + ", nickname=" + nickname + ", email="
				+ email + ", email2=" + email2 + ", homepage=" + homepage + ", zipcode=" + zipcode + ", address="
				+ address + ", detailaddress=" + detailaddress + ", extraaddress=" + extraaddress + ", phone=" + phone
				+ ", hphone=" + hphone + ", job=" + job + ", attach=" + attach + ", message=" + message + ", etc=" + etc
				+ ", mail_check=" + mail_check + ", level=" + level + ", point=" + point + ", approval=" + approval
				+ ", join_date=" + join_date + ", login_last=" + login_last + ", login_cnt=" + login_cnt + ", login_ip="
				+ login_ip + ", user_leave=" + user_leave + ", cipp=" + cipp + ", regdate=" + regdate + ", del=" + del
				+ ", category_idx=" + category_idx + "]";
	}
	
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
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
	public String getPass_ask() {
		return pass_ask;
	}
	public void setPass_ask(String pass_ask) {
		this.pass_ask = pass_ask;
	}
	public String getPass_account() {
		return pass_account;
	}
	public void setPass_account(String pass_account) {
		this.pass_account = pass_account;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getExtraaddress() {
		return extraaddress;
	}
	public void setExtraaddress(String extraaddress) {
		this.extraaddress = extraaddress;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHphone() {
		return hphone;
	}
	public void setHphone(String hphone) {
		this.hphone = hphone;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getAttach() {
		return attach;
	}
	public void setAttach(String attach) {
		this.attach = attach;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public int getMail_check() {
		return mail_check;
	}
	public void setMail_check(int mail_check) {
		this.mail_check = mail_check;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getApproval() {
		return approval;
	}
	public void setApproval(int approval) {
		this.approval = approval;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	public String getLogin_last() {
		return login_last;
	}
	public void setLogin_last(String login_last) {
		this.login_last = login_last;
	}
	public int getLogin_cnt() {
		return login_cnt;
	}
	public void setLogin_cnt(int login_cnt) {
		this.login_cnt = login_cnt;
	}
	public String getLogin_ip() {
		return login_ip;
	}
	public void setLogin_ip(String login_ip) {
		this.login_ip = login_ip;
	}
	public int getUser_leave() {
		return user_leave;
	}
	public void setUser_leave(int user_leave) {
		this.user_leave = user_leave;
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
	
	/*
	public String toStringPhone (String phone, String phone2, String phone3) {
		return phone + "-" + phone2 + "-" + phone3;		
	}
	
	public String[] parsePhone(){
        String[] phones = new String[3];
        int mid = phone.length() == 10? 7:8;
        phones[0] = phone.substring(0,3);
        phones[1] = phone.substring(4,mid);
        phones[2] = phone.substring(mid,phone.length()-1);
        return phones;
    }
	
	public String toStringEmail (String email, String email2) {
		return email + "@" + email2 ;		
	}
	
	public String[] parseEmail(){
        String[] emails = email.split("@");
        return emails;
    }
    */
	
	
	
}
