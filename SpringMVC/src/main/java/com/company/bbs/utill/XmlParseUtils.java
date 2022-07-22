package com.company.bbs.utill;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

@SuppressWarnings("unused")
public class XmlParseUtils {

	private static final Logger logger = LoggerFactory.getLogger(XmlParseUtils.class);

	// 출처: https://sallykim5087.tistory.com/187?category=895929 [sally의 프로그래밍 공부:티스토리]
	// tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nNode = (Node) nList.item(0);
		if (nNode == null)
			return null;
		return nNode.getNodeName();
	}

	// XML파싱 처리
	public static String xmlparse(String result) throws ParserConfigurationException, SAXException {

		try {
			// 1.Url설정
			String url = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?serviceKey=hiViuwIGjr7rUCTyOmmmvPnPjPcUNSZg6XvXbo2llXpf2xHXAuYWtCREqrOmXIEE5a0McLePjyCHja%2B6FMzQ1Q%3D%3D&pageNo=1&numOfRows=10&LAWD_CD=11110&DEAL_YMD=202202";

			// File file = new File("company.xml");
			// 2.Document객체 생성 
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document document = db.parse(url);
			document.getDocumentElement().normalize();
			System.out.println("Root Element :" + document.getDocumentElement().getNodeName());

			// 3.파싱할 데이터가 있는 tag에 접근하기
			NodeList nList = document.getElementsByTagName("items").item(0).getChildNodes();
			System.out.println("파싱할 리스트 수 : " + nList.getLength());
			
			// 4.nList에 담긴 데이터 꺼내오기 
			List<Map<String, String>> list = new ArrayList<>();
			for (int i = 0; i < nList.getLength(); i++) {
				
				Map<String, String> map = new HashMap<>();
				Node nNode = nList.item(i);

				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					// getTagValue()함수 사용
					// System.out.println("거래금액 : " + getTagValue("item", eElement));

					 System.out.println("거래금액 : " + eElement.getElementsByTagName("거래금액").item(0).getTextContent());
					 System.out.println("거래유형 : " + eElement.getElementsByTagName("거래유형").item(0).getTextContent());
					 System.out.println("건축년도 : " + eElement.getElementsByTagName("건축년도").item(0).getTextContent());
					 System.out.println("년 : " + eElement.getElementsByTagName("년").item(0).getTextContent());
					 System.out.println("도로명 : " +	 eElement.getElementsByTagName("도로명").item(0).getTextContent());
					 System.out.println("도로명건물본번호코드 : " + eElement.getElementsByTagName("도로명건물본번호코드").item(0).getTextContent());
					 System.out.println("도로명건물부번호코드 : " + eElement.getElementsByTagName("도로명건물부번호코드").item(0).getTextContent());
					 System.out.println("도로명시군구코드 : " +	eElement.getElementsByTagName("도로명시군구코드").item(0).getTextContent());
					 System.out.println("도로명일련번호코드 : " +	 eElement.getElementsByTagName("도로명일련번호코드").item(0).getTextContent());
					 System.out.println("도로명지상지하코드 : " +	 eElement.getElementsByTagName("도로명지상지하코드").item(0).getTextContent());
					 System.out.println("도로명코드 : " + eElement.getElementsByTagName("도로명코드").item(0).getTextContent());
					 System.out.println("법정동 : " + eElement.getElementsByTagName("법정동").item(0).getTextContent());
					 System.out.println("법정동본번코드 : " + eElement.getElementsByTagName("법정동본번코드").item(0).getTextContent());
					 System.out.println("법정동부번코드 : " + eElement.getElementsByTagName("법정동부번코드").item(0).getTextContent());
					 System.out.println("법정동시군구코드 : " + eElement.getElementsByTagName("법정동시군구코드").item(0).getTextContent());
					 System.out.println("법정동읍면동코드 : " + eElement.getElementsByTagName("법정동읍면동코드").item(0).getTextContent());
					 System.out.println("법정동지번코드 : " + eElement.getElementsByTagName("법정동지번코드").item(0).getTextContent());
					 System.out.println("아파트 : " + eElement.getElementsByTagName("아파트").item(0).getTextContent());
					 System.out.println("월 : " + eElement.getElementsByTagName("월").item(0).getTextContent());
					 System.out.println("일 : " + eElement.getElementsByTagName("일").item(0).getTextContent());
					 System.out.println("일련번호 : " + eElement.getElementsByTagName("일련번호").item(0).getTextContent());
					 System.out.println("전용면적 : " + eElement.getElementsByTagName("전용면적").item(0).getTextContent());
					 System.out.println("중개사소재지 : " +	 eElement.getElementsByTagName("중개사소재지").item(0).getTextContent());
					 System.out.println("지번 : " + eElement.getElementsByTagName("지번").item(0).getTextContent());
					 System.out.println("지역코드 : " + eElement.getElementsByTagName("지역코드").item(0).getTextContent());
					 System.out.println("층 : " + eElement.getElementsByTagName("층").item(0).getTextContent());
					 System.out.println("해제사유발생일 : " + eElement.getElementsByTagName("해제사유발생일").item(0).getTextContent());
					 System.out.println("해제여부 : " + eElement.getElementsByTagName("해제여부").item(0).getTextContent());
				}
			}
		} catch (IOException e) {
			System.out.println(e);
		}

		return result;
	}
}