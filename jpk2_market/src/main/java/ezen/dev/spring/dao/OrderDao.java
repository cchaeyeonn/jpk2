package ezen.dev.spring.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.OrderVo;
import ezen.dev.spring.vo.ProductVo;

@Repository
public class OrderDao {

	//MyBatis瑜� �씠�슜�빐�꽌 DB�옉�뾽: SqlSession 媛앹껜 �븘�슂
	
	private SqlSession sqlSession;
	
	@Autowired
	public OrderDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public static final String MAPPER = "ezen.dev.spring.order";

	public int add_order(OrderVo orderVo) {
		
		return sqlSession.insert(MAPPER+".add_order", orderVo);
	}

	public List<OrderVo> getOrderList(Integer midx) {
		return sqlSession.selectList(MAPPER+".getOrderList",midx);
	}

	public int getoidx(OrderVo orderVo) {
		
		return sqlSession.selectOne(MAPPER+".getoidx", orderVo);
	}
	


}
