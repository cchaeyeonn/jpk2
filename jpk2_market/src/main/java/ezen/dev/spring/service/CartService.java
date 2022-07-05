package ezen.dev.spring.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.CartDao;
import ezen.dev.spring.dao.MemberDao;
import ezen.dev.spring.vo.CartVo;
import ezen.dev.spring.vo.MemberVo;

@Service
public class CartService {
	
	private CartDao cartDao;
	
	@Autowired
	public CartService(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	

	public CartVo getCartInfo(String member_id) {
		 
		return cartDao.getCartInfo(member_id);
	}

}
