package com.company.bbs.service.category;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.company.bbs.dao.category.CategoryDao;
import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.category.CategoryVO;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Inject
	CategoryDao dao;
	Criteria criteria;
	
	// 암호화 설정 
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
		
	// 글목록 
	@Override
	public List<CategoryVO> getList(Criteria criteria) throws Exception {
		return dao.getList(criteria);
	}
			
	// 글저장 
	@Override
	public void insert(CategoryVO categoryVO) throws Exception {

		// for(int i=1; i <=1000; i++) {
		int category_idx = categoryVO.getCategory_idx();
		String title = categoryVO.getTitle();
		String name = categoryVO.getName();
		int parent = categoryVO.getParent();
		int depth = categoryVO.getDepth();
		int sortno = categoryVO.getSortno();
		String del = categoryVO.getDel();
		String pass = categoryVO.getPass();
		
		// 비밀번호 암호화 
		String pwdBycrypt = passwordEncoder.encode(pass);
				
		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();

		// 날짜변
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date();
		String regdate = formatter.format(currentTime);
		
		// 치환함수 적용
		//content = content.replace(" ", "&nbsp;");
		//content = content.replace("<", "&lt;");
		//content = content.replace(">", "&gt;");		
		//content = content.replace("\n", "<br>");
		
		// 긴글입력
		// StringReader scontent = new StringReader(content);
		
		int number = getCount(criteria);
		
		if(number != 0) {
			number = getMaxNum() + 1;	
		} else {
			number = 1;
		}
		
		// 답글일경우 
		if (category_idx != 0) {
			getReply(categoryVO);
			depth = depth + 1;
			sortno = sortno + 1;
			del = "N";
		} else { // 새글일경우
			parent = number;
			depth = 0;
			sortno = 0;
			del = "N";
		}
		
		categoryVO.setCategory_idx(number);
		categoryVO.setParent(parent);
		categoryVO.setDepth(depth);
		categoryVO.setSortno(sortno);
		categoryVO.setCipp(cipp);
		categoryVO.setRegdate(regdate);
		categoryVO.setDel(del);
		categoryVO.setPass(pwdBycrypt);
		// categoryVO.setTitle(i + "번쨰 제목입니다.");

		dao.insert(categoryVO);
		// }
	}
	
	// 답글업데이트 
	@Override
	public void getReply(CategoryVO categoryVO) throws Exception {
		 dao.getReply(categoryVO);
	}
	
	// 글보기 
	@Override
	public CategoryVO getView(int category_idx) throws Exception {
		return dao.getView(category_idx);
	}
	
	// 글수정 
	@Override
	public void update(CategoryVO categoryVO) throws Exception {
		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();
		categoryVO.setCipp(cipp);
		dao.update(categoryVO);
	}
	
	// 글삭제 
	@Override
	public void delete(int category_idx) throws Exception {
		dao.delete(category_idx);
	}
	
	// 글조회수 
	@Override
	public void increaseCnt(int category_idx) throws Exception {
		dao.increaseCnt(category_idx);
	}
	
	// 글이전값 
	@Override
	public CategoryVO getPrevNum(int category_idx) throws Exception {
		return dao.getPrevNum(category_idx);
	}
	
	// 글다음값 
	@Override
	public CategoryVO getNextNum(int category_idx) throws Exception {
		return dao.getNextNum(category_idx);
	}
	
	// 글최고값 
	@Override
	public int getMaxNum() throws Exception {
		return dao.getMaxNum();
	}
	
	// 글갯수 
	@Override
	public int getCount(Criteria criteria) throws Exception {
		return dao.getCount(criteria);
	}
	

	// 글비밀번호리턴 
	@Override
	public String getPassword(int category_idx) throws Exception {
		return dao.getPassword(category_idx);
	}
	
	// 카테고리목록
	@Override
	public List<Object> getCategoryList(int kind) throws Exception {
		return dao.getCategoryList(kind);
	}
	

}
