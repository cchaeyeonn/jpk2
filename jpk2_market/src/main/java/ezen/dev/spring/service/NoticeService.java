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
	
	@Autowired //해당 변수 및 메서드에 스프링이 관리하는 Bean을 자동으로 매핑
	public NoticeService(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	
	//공지사항 리스트
	public List<NoticeVo> getNoticeList() {
		return noticeDao.getNoticeList();
	}

	//공지사항 글쓰기
	public int insertNotice(NoticeVo noticeVo) {
		return noticeDao.insertNotice(noticeVo);
	}

	//공지사항 자세히보기
	public NoticeVo noticedetail(String nidx) {
		return noticeDao.noticedetail(nidx);
	}
	
	//공지사항 수정하기
	public int updateNotice(NoticeVo noticeVo) {
		return noticeDao.updateNotice(noticeVo);
	}

	//공지사항 삭제하기
	public int delNotice(NoticeVo noticeVo) {
		return noticeDao.delNotice(noticeVo);
		
	}

/*	public void noticeupdate() {
		// TODO Auto-generated method stub
		
	}

	
	//공지사항 수정하기
	public int updateNotice(NoticeVo noticeVo) {
		return noticeDao.updateNotice(noticeVo);
	}*/
	 
}
