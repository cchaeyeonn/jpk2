package ezen.dev.spring.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.MemberDao;
import ezen.dev.spring.email.MailHandler;
import ezen.dev.spring.email.TempKey;
import ezen.dev.spring.vo.MemberVo;

@Service
public class MemberService {
	
	private MemberDao memberDao;
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	
	//회원가입 처리 메소드:join()
	public void join(MemberVo memberVo) throws Exception {
		
		String key = new TempKey().generateKey(20);
		
		memberVo.setMember_key(key);
		
		memberDao.joinMember(memberVo);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("서비스 이메일 인증");
		sendMail.setText(
				new StringBuffer()
				.append("<h1>메일인증</h1>")
				.append("<a href='http://localhost:8080/spring/emailConfirm?authkey=")
				.append(key)
				.append("'target='_blank'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("zoszo@jbnu.ac.kr", "jpk2");
		sendMail.setTo(memberVo.getMember_email());
		sendMail.send();
	}
	
	public HashMap<String, Long> login(HashMap<String,String> loginInfo) {
		return memberDao.loginMember(loginInfo);
	}


	public MemberVo getMemberInfo(String member_id) {
		 
		return memberDao.getMemberInfo(member_id);
	}


	public MemberVo userAuth(String member_Key) throws Exception {
		MemberVo memberVo = new MemberVo();
		memberVo = memberDao.chkAuth(member_Key);
		if(memberVo!=null) {
			try {
				memberDao.successAuth(memberVo);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return memberVo;
	}


	public String getAuthInfo(String member_id) {
		return memberDao.getAuthInfo(member_id);
	}


	public MemberVo getIdInfo(HashMap<String, String> findId) {

		return memberDao.getIdInfo(findId);
	}


	public int setTempPw(MemberVo memberVo) throws Exception{
		
		String key = new TempKey().generateKey(6);
		memberVo.setMember_pw(key);

		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("임시 비밀번호 안내");
		sendMail.setText(
				new StringBuffer()
				.append("<h1>임시비밀번호가 주어집니다.</h1>")
				.append("임시비밀번호로 로그인 후 반드시 비밀번호를 변경해주세요.<p/>")
				.append("임시비밀번호:")
				.append(key)
				.append("<a href='http://localhost:8080/spring/login.do'>로그인</a>")
				.toString());
		sendMail.setFrom("zoszo@jbnu.ac.kr", "jpk2");
		sendMail.setTo(memberVo.getMember_email());
		sendMail.send();
		return memberDao.setTempPw(memberVo);
	}
	



	public void setUpdatePw(MemberVo memberVo) {
		memberDao.setUpdatePw(memberVo);
		
	}

}
