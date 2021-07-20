package com.company.bbs.utill;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.util.HashMap;

import org.apache.commons.text.StringSubstitutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileReadUtils {

	private static final Logger logger = LoggerFactory.getLogger(FileReader.class);

	public String readFile(String filename) throws Exception {		
		
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filename),"UTF8"));
		StringBuilder sb = new StringBuilder();
        String line = br.readLine();

        while (line != null) {
            sb.append(line);
            sb.append("\n");
            line = br.readLine();
        }
		
		return sb.toString();
		
		/*
		// 파일 객체 생성
		Path path = Paths.get(
				"/Users/ojeonghwan/git/project/SpringMVC/src/main/webapp/WEB-INF/views/modules/member/license01.txt");

		// 캐릭터셋 지정
		Charset cs = StandardCharsets.UTF_8;

		// 파일 내용담을 리스트
		List<String> list = new ArrayList<String>();

		list = Files.readAllLines(path, cs);

		for (String readLine : list) {
			System.out.println(readLine);
		}
		*/
	}
	
	public String changeContents(HashMap<String, ?> param, String formatString) throws Exception {
		
		StringSubstitutor sub = new StringSubstitutor(param);
		
		return sub.replace(formatString);
	} 
	

}
