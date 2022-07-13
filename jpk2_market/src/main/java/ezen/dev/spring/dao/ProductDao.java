package ezen.dev.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.ProductVo;

@Repository
public class ProductDao {

	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.product";
	
	@Autowired
	public ProductDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<ProductVo> getProductList() {
		return sqlSession.selectList(MAPPER+".getProductList");
	}
	public ProductVo getProductInfo(String pidx) {

		return sqlSession.selectOne(MAPPER+".getProductInfo", pidx);
	}
	


}
