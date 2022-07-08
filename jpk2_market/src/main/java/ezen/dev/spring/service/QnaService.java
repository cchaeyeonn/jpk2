package ezen.dev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.AdminDao;
import ezen.dev.spring.dao.NoticeDao;
import ezen.dev.spring.dao.ProductDao;
import ezen.dev.spring.dao.QnaDao;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.NoticeVo;
import ezen.dev.spring.vo.ProductVo;
import ezen.dev.spring.vo.QnaVo;

@Service
public class QnaService {
	
	private QnaDao qnaDao;
	
	@Autowired
	public QnaService(QnaDao qnaDao) {
		this.qnaDao = qnaDao;
	}
	
	public List<QnaVo> getQnaList() {
		return qnaDao.getQnaList();
	}

	
}
