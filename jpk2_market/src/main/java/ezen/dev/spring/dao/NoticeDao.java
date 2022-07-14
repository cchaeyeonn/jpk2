package ezen.dev.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.NoticeVo;
import ezen.dev.spring.vo.ProductVo;

@Repository
public class NoticeDao {

	
	private SqlSession sqlSession;
	
	//맵퍼에서 spring.service_center를 찾을수 있게
	public static final String MAPPER = "ezen.dev.spring.service_center";
	
	@Autowired //스프링에서 빈 인스턴스가 생성된 이후 @Autowired를 설정한 메서드가 자동으로 호출되고, 인스턴스가 자동으로 주입
				//해당 변수 및 메서드에 스프링이 관리하는 Bean을 자동으로 매핑
	public NoticeDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//공지사항 리스트
	public List<NoticeVo> getNoticeList() {	
		return sqlSession.selectList(MAPPER+".getNoticeList"); //맵퍼에서 찾아갈수 있도록
	}
	
	
	//공지사항 글쓰기
	public int insertNotice(NoticeVo noticeVo) {
		return sqlSession.insert(MAPPER+".insertNotice", noticeVo);
	}
	
	
	//공지사항 자세히보기
	public NoticeVo noticedetail(String nidx) {
		return sqlSession.selectOne(MAPPER+".noticedetail", nidx);
	}

	/*
	 * //공지사항 수정하기 public int modifyNotice(NoticeVo noticeVo) { return
	 * sqlSession.modify(MAPPER+".modifyNotice", noticeVo); }
	 */

}
