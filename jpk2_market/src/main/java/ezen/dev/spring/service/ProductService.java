package ezen.dev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.AdminDao;
import ezen.dev.spring.dao.ProductDao;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.ProductVo;

@Service
public class ProductService {
	
	private ProductDao productDao;
	
	@Autowired
	public ProductService(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	public List<ProductVo> getProductList() {
		return productDao.getProductList();
	}

	public ProductVo getProductInfo(String pidx) {
		
		return productDao.getProductInfo(pidx);
	}

	public List<ProductVo> getProductListType(String p_type) {

		return productDao.getProductListType(p_type);
	}
	
}
