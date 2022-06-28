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
	
	@Autowired //�옄�룞 �쓽議� 二쇱엯: �깮�꽦�옄 諛⑹떇
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/join.do")
	public String join() {
		return "member/join";
	}
	
	@PostMapping("/joinProcess.do")
	public String joinProcess(MemberVo memberVo) {
		
		int result=memberService.join(memberVo);
		
		String viewPage = null;
		if(result==1) {
			viewPage = "redirect:/login.do";
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
	 * memberVo, HttpServletRequest request) { //�슂泥�留ㅽ븨�씠 �엳�뒗 硫붿냼�뱶�쓽 留ㅺ컻蹂��닔�뿉 Vo�굹 �옄諛뷀겢�옒�뒪媛� �엳�뒗
	 * 寃쎌슦 �쟾�떖�맂 媛믪쓣 洹� 媛앹껜�뿉 留ㅽ븨�떆耳쒖쨲 //�씠�윭�븳 媛앹껜瑜� 而ㅻ㎤�뱶 媛앹껜�씪怨� �븿.
	 * 
	 * HashMap<String, Long> resultMap=memberService.login(memberVo); long
	 * member_auth = resultMap.get("member_auth");//�쉶�썝�씤利� long member_grade =
	 * resultMap.get("member_grade");//�쉶�썝�벑湲�
	 * 
	 * String viewPage = null; if(member_auth==1) { HttpSession session =
	 * request.getSession(); session.setAttribute("member_id",
	 * memberVo.getMember_id());//�쉶�썝�씤利� 異붽� session.setAttribute("member_grade",
	 * member_grade);//�쉶�썝�벑湲� 異붽� viewPage = "redirect:/home.do";
	 * 
	 * }else{ viewPage = "member/login"; }
	 * 
	 * return viewPage; }
	 */
	
	@PostMapping("/loginProcess.do")
	public String loginProcess(@RequestParam("member_id") String member_id,
			 					@RequestParam("member_pw") String member_pw, 
			 					HttpServletRequest request) {

		//2媛쒖쓽 �쟾�떖媛믪쓣 HashMap媛앹껜�뿉 ���옣�빐�꽌 MyBatis �엯�젰媛믪쑝濡� �궗�슜
		HashMap<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("member_id", member_id);
		loginInfo.put("member_pw", member_pw);
		
		//2媛쒖쓽 寃곌낵媛믪쓣 �뼸怨좎옄 HashMap 媛앹껜 �궗�슜
		HashMap<String, Long> resultMap=memberService.login(loginInfo);
		long member_auth = resultMap.get("member_auth");//�쉶�썝�씤利�
		long member_grade = resultMap.get("member_grade");//�쉶�썝�벑湲�
		
		String viewPage = null;
		if(member_auth==1) {
			HttpSession session = request.getSession();
			session.setAttribute("member_id", member_id);//�쉶�썝�씤利� 異붽�	
			//session.setAttribute("member_grade", member_grade);//�쉶�썝�벑湲� 異붽�
			viewPage = "redirect:/index.do";
		
		}else{
			viewPage = "member/login";
		}
		
		return viewPage;
	}
	
	@GetMapping("/memberInfo.do")
	public String memberInfo(Model model, HttpServletRequest request) {
		//�쉶�썝�젙蹂대�� 媛��졇�삤湲� �쐞�빐 �꽭�뀡媛앹껜�뿉 ���옣�맂 member_id �씠�슜
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		MemberVo memberVo = memberService.getMemberInfo(member_id);
		//Spring MVC�뿉�꽌 Controller�뿉�꽌 �깮�꽦�릺�뒗 Model媛앹껜�뒗 酉곕떒(JSP�럹�씠吏�)�뿉�꽌 李몄“ 媛��뒫
		model.addAttribute("memberVo", memberVo);
		
		return "member/memberInfo";
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/index.do";
	}
	
}
