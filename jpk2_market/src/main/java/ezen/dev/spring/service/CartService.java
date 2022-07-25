package ezen.dev.spring.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.CartDao;
import ezen.dev.spring.dao.MemberDao;
import ezen.dev.spring.vo.CartVo;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.OrderVo;
import ezen.dev.spring.vo.ProductVo;

@Service
public class CartService {
	
	private CartDao cartDao;
	
	@Autowired
	public CartService(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	

	public List<CartVo> getCartList(Integer midx) {
		return cartDao.getCartList(midx);
	}

	public int addCart(CartVo cartVo) {
		return cartDao.addCart(cartVo);
	}
	public int cart_count(int midx_) {
		int result=0;
		result = cartDao.cart_count(midx_);
		return result;
	}
	public int updateCart(CartVo cartVo) {
		return cartDao.updateCart(cartVo);
	} 
	public ArrayList<Integer> cart_pidx_pc(int midx_) {
		 
		return  (ArrayList<Integer>) cartDao.cart_pidx_pc(midx_);
	}
	
	public List<OrderVo> getSomeCartList(List<Integer> pbidxList) {
		return cartDao.getSomeCartList(pbidxList);
	}
	
}
