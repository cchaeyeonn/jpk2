package ezen.dev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.AdminDao;
import ezen.dev.spring.vo.MemberVo;

@Service
public class AdminService {
	
	private AdminDao adminDao;
	
	@Autowired
	public AdminService(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	public List<MemberVo> getMemberList() {
		return adminDao.getMemberList();
	}

}
