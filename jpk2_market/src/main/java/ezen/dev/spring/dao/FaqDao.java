package ezen.dev.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.FaqVo;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.NoticeVo;
import ezen.dev.spring.vo.ProductVo;

@Repository
public class FaqDao {

	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.service_center";
	
	@Autowired
	public FaqDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public List<FaqVo> getFaqList() {
		return sqlSession.selectList(MAPPER+".getFaqList");
	}

	public int insertFaq(FaqVo faqVo) {
		return sqlSession.insert(MAPPER+".insertFaq",faqVo);
	}
	public FaqVo getFaqInfo(String fidx) {
		return sqlSession.selectOne(MAPPER+".getFaqInfo",fidx);
	}
	public int updateFaq(FaqVo faqVo) {
		return sqlSession.update(MAPPER+".updateFaq",faqVo);
	}
	public FaqVo faqdetail(String fidx) {
		return sqlSession.selectOne(MAPPER+".faqdetail",fidx);
		
	}

	

	


}
