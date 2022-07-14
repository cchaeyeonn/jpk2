package ezen.dev.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.CartVo;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.ProductVo;

@Repository
public class CartDao {
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.cart";
	
	@Autowired
	public CartDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public List<CartVo> getCartList(Integer midx) {
		return sqlSession.selectList(MAPPER+".getCartList",midx);
	}
     public int addCart(CartVo cartVo) {
		
		return sqlSession.insert(MAPPER+".addCart", cartVo);
	}
     public int deleteCartInfo(List<Integer> cartidxList) {
 		return sqlSession.delete(MAPPER+".deleteCartInfo", cartidxList);
 	}
     public int deleteCartInfoOne(Integer pbidx) {
  		return sqlSession.delete(MAPPER+".deleteCartInfoOne", pbidx);
  	} 
     public int cart_count(int midx_) {
 		return sqlSession.selectOne(MAPPER+".cart_count", midx_);
 	}
     
}
