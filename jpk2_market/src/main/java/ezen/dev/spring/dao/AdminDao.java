package ezen.dev.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.ProductVo;

@Repository
public class AdminDao {

	//MyBatis瑜� �씠�슜�빐�꽌 DB�옉�뾽: SqlSession 媛앹껜 �븘�슂
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.admin";
	
	@Autowired
	public AdminDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<MemberVo> getMemberList() {
		return sqlSession.selectList(MAPPER+".getMemberList");
	}

	public int addProduct(ProductVo productVo) {
		
		return sqlSession.insert(MAPPER+".addProduct", productVo);
		
	}

	public List<ProductVo> getProductList(Integer midx) {
		return sqlSession.selectList(MAPPER+".getProductList", midx);
	}

	public int delProduct(ProductVo productVo) {
		return sqlSession.update(MAPPER+".delProduct",productVo);
	}

	public List<ProductVo> getAdminProductListDetail(ProductVo productVo) {
		return sqlSession.selectList(MAPPER+".getAdminProductListDetail",productVo);
	}


}
