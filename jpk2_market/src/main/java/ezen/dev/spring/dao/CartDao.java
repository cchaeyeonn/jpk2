package ezen.dev.spring.dao;

import java.util.ArrayList;
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
     public int updateCart(CartVo cartVo) {
 		
 		return sqlSession.update(MAPPER+".updateCart", cartVo);
    }
     public List<Integer> cart_pidx_pc(int midx_) {
    	return sqlSession.selectList(MAPPER+".cart_pidx_pc", midx_);
    	
    }
	public int cart_amount(CartVo cartVo) {
		
		return sqlSession.update(MAPPER+".cart_amount", cartVo);
	}
	public List<CartVo> getSomeCartList(List<Integer> pbidx) {

		return sqlSession.selectList(MAPPER+".getSomeCartList", pbidx);
	}	 
  
     
}
