package ezen.dev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.AdminDao;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.ProductVo;

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

	public int addProduct(ProductVo productVo) {
		return adminDao.addProduct(productVo);
	}

	public List<ProductVo> getProductList(Integer midx) {
		return adminDao.getProductList(midx);
	}

	public int delProduct(ProductVo productVo) {
		return adminDao.delProduct(productVo);
	}
	
}
