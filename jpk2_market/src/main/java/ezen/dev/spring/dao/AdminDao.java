package ezen.dev.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.AdminVo;
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

	public List<ProductVo> getProductCheck() {

		return sqlSession.selectList(MAPPER+".getProductCheck");
	}

	public ProductVo getProductInfo(Integer pidx) {
		return sqlSession.selectOne(MAPPER+".getProductInfo",pidx);
	}

	public int adminProductOk(Integer pidx) {
		return sqlSession.update(MAPPER+".adminProductOk",pidx);
	}

	public int adminMemberUp(Integer midx) {
		return sqlSession.update(MAPPER+".adminMemberUp",midx);
	}

	public int adminMemberDelyn(Integer midx) {
		return sqlSession.update(MAPPER+".adminMemberDelyn",midx);
	}

	public List<ProductVo> getBuyerList(Integer pidx) {
		return sqlSession.selectList(MAPPER+".getBuyerList",pidx);
	}

	public ProductVo getBuyerDetail(ProductVo pVo) {
		return sqlSession.selectOne(MAPPER+".getBuyerDetail",pVo);
	}


	public List<AdminVo> getStatisticsList(AdminVo adminVo) {
		
		return sqlSession.selectList(MAPPER+".getStatisticsList", adminVo);
	}

	public List<AdminVo> getStatisticsList2(AdminVo adminVo) {
		return sqlSession.selectList(MAPPER+".getStatisticsList2", adminVo);
	}



}
