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
	// 컨트롤러 - Service - dao는 반드시 1:1:1 매칭이 되어야 하는것은 아니다.
		// 지금처럼 한 Service에 2개의 서비스를 연결하는것도 가능하다. 주로 사용하는 Dao는 생성자방식, 사용 빈도수가 낮은 Dao는 set방식으로 객체 주입을 한다.
	
	
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


	public int checkPw(String pw) {
		int result=0;
		result = memberDao.checkPw(pw);
		return result;
	}
	


}
