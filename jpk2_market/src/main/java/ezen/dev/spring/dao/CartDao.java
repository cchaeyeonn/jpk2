package ezen.dev.spring.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.CartVo;
import ezen.dev.spring.vo.MemberVo;

@Repository
public class CartDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.cart";
	
	@Autowired
	public CartDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	

	public CartVo getCartInfo(String member_id) {
		return sqlSession.selectOne(MAPPER+".getCartInfo", member_id);
	}

	

}