package ezen.dev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.AdminDao;
import ezen.dev.spring.vo.AdminVo;
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

	public List<ProductVo> getAdminProductListDetail(ProductVo productVo) {
		return adminDao.getAdminProductListDetail(productVo);
	}

	public List<ProductVo> getProductCheck() {
		
		return adminDao.getProductCheck();
	}

	public ProductVo getProductInfo(Integer pidx) {
		return adminDao.getProductInfo(pidx);
	}

	public int adminProductOk(Integer pidx) {

		return adminDao.adminProductOk(pidx);
	}

	public int adminMemberUp(Integer midx) {
		return adminDao.adminMemberUp(midx);
	}

	public int adminMemberDelyn(Integer midx) {
		return adminDao.adminMemberDelyn(midx);
	}


	public List<AdminVo> getStatisticsList(AdminVo adminVo) {
		
		return adminDao.getStatisticsList(adminVo);
	}
	public List<ProductVo> getBuyerList(Integer pidx) {
		return adminDao.getBuyerList(pidx);
	}

	public ProductVo getBuyerDetail(ProductVo pVo) {
		return adminDao.getBuyerDetail(pVo);

	}

	public List<AdminVo> getStatisticsList2(AdminVo adminVo) {
		return adminDao.getStatisticsList2(adminVo);
	}
	public int failProduct(ProductVo productVo) {
		return adminDao.failProduct(productVo);
	}

}
