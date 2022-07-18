package ezen.dev.spring.service;

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

}
