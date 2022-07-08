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
	public List<NoticeVo> getNoticeList() {
		return sqlSession.selectList(MAPPER+".getNoticeList");
	}
	
	/*
	 * public NoticeVo getNoticeInfo(String nidx) {
	 * 
	 * return sqlSession.selectOne(MAPPER+".getNoticeInfo", nidx); }
	 */
	


}
