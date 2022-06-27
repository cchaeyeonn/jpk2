package ezen.dev.spring.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.dev.spring.service.MemberService;
import ezen.dev.spring.vo.MemberVo;

@Controller
public class MemberController {
	
	private MemberService memberService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/join.do")
	public String join() {
		return "member/join";
	}
	
	@PostMapping("/joinProcess.do")
	public String joinProcess(MemberVo memberVo) {
		//요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는 경우 전달된 값을 그 객체에 매핑시켜줌
		//이러한 객체를 커맨드 객체라고 함.
		int result=memberService.join(memberVo);
		
		String viewPage = null;
		if(result==1) {
			viewPage = "redirect:/home.do";
		}else{
			viewPage = "member/join";
		}
		
		return viewPage;
	}
	
	@GetMapping("/login.do")
	public String login() {
		return "member/login";
	}
	
	/*
	 * @PostMapping("/loginProcess.do") public String loginProcess(MemberVo
	 * memberVo, HttpServletRequest request) { //요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는
	 * 경우 전달된 값을 그 객체에 매핑시켜줌 //이러한 객체를 커맨드 객체라고 함.
	 * 
	 * HashMap<String, Long> resultMap=memberService.login(memberVo); long
	 * member_auth = resultMap.get("member_auth");//회원인증 long member_grade =
	 * resultMap.get("member_grade");//회원등급
	 * 
	 * String viewPage = null; if(member_auth==1) { HttpSession session =
	 * request.getSession(); session.setAttribute("member_id",
	 * memberVo.getMember_id());//회원인증 추가 session.setAttribute("member_grade",
	 * member_grade);//회원등급 추가 viewPage = "redirect:/home.do";
	 * 
	 * }else{ viewPage = "member/login"; }
	 * 
	 * return viewPage; }
	 */
	
	@PostMapping("/loginProcess.do")
	public String loginProcess(@RequestParam("member_id") String member_id,
			 					@RequestParam("member_pw") String member_pw, 
			 					HttpServletRequest request) {

		//2개의 전달값을 HashMap객체에 저장해서 MyBatis 입력값으로 사용
		HashMap<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("member_id", member_id);
		loginInfo.put("member_pw", member_pw);
		
		//2개의 결과값을 얻고자 HashMap 객체 사용
		HashMap<String, Long> resultMap=memberService.login(loginInfo);
		long member_auth = resultMap.get("member_auth");//회원인증
		long member_grade = resultMap.get("member_grade");//회원등급
		
		String viewPage = null;
		if(member_auth==1) {
			HttpSession session = request.getSession();
			session.setAttribute("member_id", member_id);//회원인증 추가	
			session.setAttribute("member_grade", member_grade);//회원등급 추가
			viewPage = "redirect:/home.do";
		
		}else{
			viewPage = "member/login";
		}
		
		return viewPage;
	}
	
	@GetMapping("/memberInfo.do")
	public String memberInfo(Model model, HttpServletRequest request) {
		//회원정보를 가져오기 위해 세션객체에 저장된 member_id 이용
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		MemberVo memberVo = memberService.getMemberInfo(member_id);
		//Spring MVC에서 Controller에서 생성되는 Model객체는 뷰단(JSP페이지)에서 참조 가능
		model.addAttribute("memberVo", memberVo);
		
		return "member/memberInfo";
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/home.do";
	}
	
}
