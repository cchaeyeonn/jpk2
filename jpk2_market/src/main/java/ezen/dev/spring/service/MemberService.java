package ezen.dev.spring.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	
    @Inject
    PasswordEncoder passwordEncoder;
	
	//회원가입 처리 메소드:join()
	public void join(MemberVo memberVo) throws Exception {
		
		String key = new TempKey().generateKey(20);
		String encodedPassword = passwordEncoder.encode(memberVo.getMember_pw());
		memberVo.setMember_pw(encodedPassword);
		memberVo.setMember_key(key);
		
		memberDao.joinMember(memberVo);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[JPK2] 회원가입 인증 메일입니다.");
		sendMail.setText(
				new StringBuffer()
				.append("<!DOCTYPE html>")
				.append("<html>")
				.append("<head>")
				.append("</head>")
				.append("<body>")
				.append("<div style=\"font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 400px; height: 600px; border-top: 4px solid #02b875; padding: 30px 0; box-sizing: border-box;\">"
						+"<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">"
						+"<span style=\"font-size: 15px; margin: 0 0 10px 3px;\">JPK2</span><br />"
						+"<span style=\"color: #02b875\">메일인증</span> 안내입니다."
						+"</h1>\n"+"<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">"
						+memberVo.getMember_name()+"님 안녕하세요.<br />"
						+"JPK2에 가입해 주셔서 진심으로 감사드립니다.<br />"
						+"아래 <b style=\"color: #02b875\">'메일 인증'</b> 버튼을 클릭하여 회원가입을 완료해 주세요.<br />"
						+"감사합니다."+"</p>"
						+"<a style=\"color: #FFF; text-decoration: none; text-align: center;\""
						+"href=\"http://localhost:8090/spring/emailConfirm?authkey=" + key + "\"target=\"_blank\">"
						+"<p style=\"display: inline-block; width: 210px; height: 45px; margin: 30px 5px 40px; background: #02b875; line-height: 45px; vertical-align: middle; font-size: 16px;\">"
						+"메일 인증</p>"
						+"</a>"
						+"<div style=\"border-top: 1px solid #DDD; padding: 5px;\"></div>"
						+"</div>")
						.toString());
		sendMail.setFrom("zoszo@jbnu.ac.kr", "jpk2");
		sendMail.setTo(memberVo.getMember_email());
		sendMail.send();
	}
	
	
	public MemberVo login(String member_id) {
		return memberDao.loginMember(member_id);
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
	
	public String getNameInfo(String member_id) {
		return memberDao.getNameInfo(member_id);
	}


	public MemberVo getIdInfo(HashMap<String, String> findId) {

		return memberDao.getIdInfo(findId);
	}


	public int setTempPw(MemberVo memberVo) throws Exception{
		
		String key = new TempKey().generateKey(6);
		memberVo.setMember_pw(key);
		String name = memberVo.getMember_id();
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[JPK2]"+name+"님께서 요청하신 임시 비밀번호가 생성되었습니다.");
		sendMail.setText(
				new StringBuffer()
				.append("<h1>임시비밀번호가 주어집니다.</h1>")
				.append("임시비밀번호로 로그인 후 반드시 비밀번호를 변경해주세요.<p/>")
				.append("임시비밀번호:")
				.append(key)
				.append("<a href='http://localhost:8090/spring/login.do'>로그인</a>")
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
