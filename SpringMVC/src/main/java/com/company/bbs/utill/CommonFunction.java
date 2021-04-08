package com.company.bbs.utill;

public class CommonFunction {

	// 글 내용 특수문자 처리
	public String getReplace(String content) {
		// 설명 : replaceAll("찿을문자열" ,"바꿀문자열")
		String str = content;
		// str = str.replace("&","&amp;");
		// str = str.replace("'","&acute;");
		// str = str.replace("\"", "&cute;");
		// str = str.replace(" ", "&nbsp;");
		// str = str.replace("<", "&lt;").replaceAll(">", "&gt;");
		// str = str.replace("\r\n|\n", "<br>");
		// str = str.replace("\t", "&nbsp;&nbsp;&nbsp;&nbsp;");
		// str = str.replace("<p>", "").replace("</p>", "");
		// str = str.replace("\n", "<br>");
		return str;
	}
	
	// 전화번호 형식변환 https://goni9071.tistory.com/174
	public static String phone(String src) {
		if (src == null) {
			return "";
		}
		if (src.length() == 8) {
			return src.replaceFirst("^([0-9]{4})([0-9]{4})$", "$1-$2");
		} else if (src.length() == 12) {
			return src.replaceFirst("(^[0-9]{4})([0-9]{4})([0-9]{4})$", "$1-$2-$3");
		}
		return src.replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$", "$1-$2-$3");
	}

}
