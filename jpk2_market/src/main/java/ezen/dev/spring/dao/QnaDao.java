package ezen.dev.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.NoticeVo;
import ezen.dev.spring.vo.ProductVo;
import ezen.dev.spring.vo.QnaVo;

@Repository
public class QnaDao {

	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.service_center";
	
	@Autowired
	public QnaDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public List<QnaVo> getQnaList() {
		return sqlSession.selectList(MAPPER+".getQnaList");
	}
	
	/*
	 * public NoticeVo getNoticeInfo(String nidx) {
	 * 
	 * return sqlSession.selectOne(MAPPER+".getNoticeInfo", nidx); }
	 */
	


}
