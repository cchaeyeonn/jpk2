package ezen.dev.spring.service;

import java.util.HashMap;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.MemberDao;
@Service
public class EmailService {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao memberDao;
	
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75)+48;
			if ((num>=48&&num<=57)||(num >= 65 && num <= 90)||(num >= 97 && num <= 122)) {
				sb.append((char) num);
			}else {
				continue;
			}
		}while (sb.length()<size);
		if(lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	private boolean lowerCheck;
	private int size;
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	public void mailSendWithMemberKey(String member_email, String member_id, HttpServletRequest request) {
		
		String key = getKey(false, 20);
		memberDao = sqlSession.getMapper(MemberDao.class);
		
		HashMap<String,String> getKey = new HashMap<String,String>();
		getKey.put("member_id", member_id);
		getKey.put("member_key", key);
		memberDao.getKey(getKey);

		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 jpk2입니다<h2><br><br>"
				+"<h3>"+member_id+"님<h3>"+"<p>인증하기 버튼을 누르시면 로그인을 하실수 있습니다:"
				+"<a href='http://localhost:8090"+request.getContextPath()+"/authSucess.do?member_id="+member_id+"&member_key="+key+"'>인증하기</a></p>"
				+"(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[본인인증]jpk2의 인증메일입니다","utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(member_email));
			mailSender.send(mail);
		}catch(MessagingException e) {
			e.printStackTrace();
		}
	}
	public int alter_memberKey_service(String member_id, String key) {
		int result = 0;
		memberDao = sqlSession.getMapper(MemberDao.class);
		HashMap<String,String> getKey = new HashMap<String,String>();
		getKey.put("member_id", member_id);
		getKey.put("member_key", key);
		memberDao.getKey(getKey);
		result = memberDao.alter_memberKey(getKey);
		return result;
		
	}
}
