package ezen.dev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.AdminDao;
import ezen.dev.spring.dao.NoticeDao;
import ezen.dev.spring.dao.ProductDao;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.NoticeVo;
import ezen.dev.spring.vo.ProductVo;

@Service
public class NoticeService {
	
	private NoticeDao noticeDao;
	
	@Autowired
	public NoticeService(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	
	public List<NoticeVo> getNoticeList() {
		return noticeDao.getNoticeList();
	}

	public int insertNotice(NoticeVo noticeVo) {
		return noticeDao.insertNotice(noticeVo);
	}

	public NoticeVo noticedetail(String nidx) {
		return noticeDao.noticedetail(nidx);
	}

	 
}
