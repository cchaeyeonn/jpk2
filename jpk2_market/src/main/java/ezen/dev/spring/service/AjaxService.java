package ezen.dev.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.MemberDao;
import ezen.dev.spring.vo.MemberVo;

@Service
public class AjaxService {
	
	private MemberDao memberDao;
	
	@Autowired
	public AjaxService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public int checkId(String id) {
		int result=0;
		result = memberDao.checkId(id);
		return result;
	}
	
	


}
