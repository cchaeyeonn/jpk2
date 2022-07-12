package ezen.dev.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.NoticeVo;
import ezen.dev.spring.vo.ProductVo;

@Repository
public class NoticeDao {

	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.service_center";
	
	@Autowired
	public NoticeDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public List<NoticeVo> getNoticeList() {	//공지사항 리스트
		return sqlSession.selectList(MAPPER+".getNoticeList");
	}
	public int insertNotice(NoticeVo noticeVo) {//공지사항 글쓰기
		return sqlSession.insert(MAPPER+".insertNotice", noticeVo);
	}
	public NoticeVo noticedetail(String nidx) {//공지사항 자세히보기
		return sqlSession.selectOne(MAPPER+".noticedetail", nidx);
	}


}
