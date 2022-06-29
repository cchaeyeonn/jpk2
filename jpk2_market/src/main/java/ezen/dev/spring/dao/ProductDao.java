package ezen.dev.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.ProductVo;

@Repository
public class ProductDao {

	//MyBatis�몴占� 占쎌뵠占쎌뒠占쎈퉸占쎄퐣 DB占쎌삂占쎈씜: SqlSession 揶쏆빘猿� 占쎈툡占쎌뒄
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.product";
	
	@Autowired
	public ProductDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public ProductVo getProductInfo(String p_name) {
		return sqlSession.selectOne(MAPPER+".getProductInfo", p_name);
	}
	
	

}
