package com.company.bbs.utill;

import java.io.InputStreamReader;     
import java.net.HttpURLConnection;     
import java.net.URL;     
import java.net.URLEncoder;     
import java.io.BufferedReader;     
import java.io.IOException;     
     
public class openApiExercise {     
    public static void main(String[] args) throws IOException {     
        StringBuilder urlBuilder = new StringBuilder("http://openapi.nsdi.go.kr/nsdi/map/AdresSpceService/wfs/getAdresSpceWFS"); /* URL */   
        StringBuilder parameter  = new StringBuilder();   
        parameter.append("?" + URLEncoder.encode("authkey","UTF-8") + "=인증키"); /*authkey Key*/     
        parameter.append("&" + URLEncoder.encode("typename","UTF-8") + "=" + URLEncoder.encode("F2", "UTF-8")); /* 질의 대상인 하나 이상의 피처 유형 이름의 리스트, 값은 쉼표로 구분화면 하단의 [레이어 목록] 참고 */  
        parameter.append("&" + URLEncoder.encode("bbox","UTF-8") + "=" + URLEncoder.encode("-202843.04697433786,-17323.417179227097,604636.3870097762,575533.2088507118,EPSG:5174", "UTF-8")); /* 좌표로 이루어진 사각형 안에 담겨 있는 (또는 부분적으로 걸쳐 있는) 피처를 검색. 좌표 순서는 사용되는 좌표 시스템을 따름.일반적 표현은 하단좌표, 상단좌표, 좌표체계 순서입니다.(lc1,lc2,uc1,uc2,좌표체계) */  
        parameter.append("&" + URLEncoder.encode("maxFeatures","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 요청에 대한 응답으로 WFS가 반환해야하는 피처의 최대 값(최대 허용값 : 100) */  
        parameter.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("results", "UTF-8")); /* 요청에 대하여 WFS가 어떻게 응답할 것인지 정의.results 값은 요청된 모든 피처를 포함하는 완전한 응답이 생성되어야 함을 나타내며, hits 값은 피처의 개수만이 반환되어야 함을 의미 */  
        parameter.append("&" + URLEncoder.encode("srsName","UTF-8") + "=" + URLEncoder.encode("EPSG:5174", "UTF-8")); /* 반환되어야 할 피처의 기하에 사용되어야 할 WFS가 지원하는 좌표체계 */  
    
        URL url = new URL(urlBuilder.toString() + parameter.toString());     
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();     
        conn.setRequestMethod("GET");     
        conn.setRequestProperty("Content-type", "application/json");     
        System.out.println("Response code: " + conn.getResponseCode());     
        BufferedReader rd;     
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {     
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));     
        } else {     
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));     
        }     
        StringBuilder sb = new StringBuilder();     
        String line;     
        while ((line = rd.readLine()) != null) {     
            sb.append(line);     
        }     
        rd.close();     
        conn.disconnect();     
        System.out.println(sb.toString());     
    }     
}     
