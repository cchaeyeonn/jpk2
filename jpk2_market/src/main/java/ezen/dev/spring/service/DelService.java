package ezen.dev.spring.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.CartDao;
import ezen.dev.spring.dao.DelDao;
import ezen.dev.spring.dao.MemberDao;
import ezen.dev.spring.vo.CartVo;
import ezen.dev.spring.vo.DelVo;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.OrderVo;
import ezen.dev.spring.vo.ProductVo;

@Service
public class DelService {
	
	private DelDao delDao;
	
	@Autowired
	public DelService(DelDao delDao) {
		this.delDao = delDao;
	}
	
	

	public int add_Del(DelVo delVo) {
		return delDao.addDel(delVo);
	}
	
	
}
