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
	public ProductVo getProductInfo(String p_name) {
		 
		return productDao.getProductInfo(p_name);
	}
	
}
