package ezen.dev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.AdminDao;
import ezen.dev.spring.dao.FaqDao;
import ezen.dev.spring.dao.NoticeDao;
import ezen.dev.spring.dao.ProductDao;
import ezen.dev.spring.vo.FaqVo;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.NoticeVo;
import ezen.dev.spring.vo.ProductVo;

@Service
public class FaqService {
	
	private FaqDao faqDao;
	
	@Autowired
	public FaqService(FaqDao faqDao) {
		this.faqDao = faqDao;
	}


	public List<FaqVo> getFaqList() {
		return faqDao.getFaqList();
	}


	public int insertFaq(FaqVo faqVo) {
		return faqDao.insertFaq(faqVo);
	}


	public FaqVo getFaqInfo(String fidx) {

		return faqDao.getFaqInfo(fidx);
	}



}
