package ezen.dev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.CartDao;
import ezen.dev.spring.dao.MemberDao;
import ezen.dev.spring.vo.MemberVo;

@Service
public class AjaxService {
	
	private MemberDao memberDao;
	
	@Autowired
	public AjaxService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	private CartDao cartDao;
	
	@Autowired
	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
		
	}

	public int checkId(String id) {
		int result=0;
		result = memberDao.checkId(id);
		return result;
	}
	public int checkEmail(String email) {
		int result=0;
		result = memberDao.checkEmail(email);
		return result;
	}
	public int deleteCartInfo(List<Integer> cartidxList) {
		return cartDao.deleteCartInfo(cartidxList);
	}
	public int deleteCartInfoOne(Integer pbidx) {
		return cartDao.deleteCartInfoOne(pbidx);
	}
	


}
