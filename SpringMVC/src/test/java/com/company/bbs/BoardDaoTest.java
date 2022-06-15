package com.company.bbs;

import javax.inject.Inject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.company.bbs.dao.board.BoardDao;
import com.company.bbs.vo.board.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/**/context-*.xml"})
public class BoardDaoTest {

    private static final Logger logger = LoggerFactory.getLogger(BoardDaoTest.class);

    @Inject
    BoardDao dao;

    @Test
    public void testCreate() throws Exception {
        BoardVO dto = new BoardVO();
        dto.setTitle("새로운 글 작성 테스트 제목");
        dto.setContent("새로운 글 작성 테스트 내용");
        dto.setName("새로운 글 작성자");
        dao.insert(dto);
    }

    @Test
    public void testRead() throws Exception {
        logger.info(dao.getView(1).toString());
    }

    @Test
    public void testUpdate() throws Exception {
        BoardVO dto = new BoardVO();
        dto.setBoard_idx(1);
        dto.setTitle("글 수정 테스트 제목");
        dto.setContent("글 수정 테스트 내용");
        dao.update(dto);
    }

    @Test
    public void testDelete() throws Exception {
        dao.delete(1);
    }
}

