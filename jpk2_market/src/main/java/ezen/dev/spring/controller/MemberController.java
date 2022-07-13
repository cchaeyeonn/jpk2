package ezen.dev.spring.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.dev.spring.service.EmailService;
import ezen.dev.spring.service.MemberService;
import ezen.dev.spring.vo.MemberVo;

@Controller
public class MemberController {
	
	private MemberService memberService;

	
	
	@Autowired //占쎌쁽占쎈짗 占쎌벥鈺곤옙 雅뚯눘�뿯: 占쎄문占쎄쉐占쎌쁽 獄쎻뫗�뻼
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	private EmailService emailService;
	@Autowired
	public void setEmailService(EmailService emailService) {
		this.emailService = emailService;
	}
	
	@GetMapping("/join.do")
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value="/joinProcess.do", method = RequestMethod.POST)
	public String joinProcess(MemberVo memberVo, HttpServletRequest request) {
		
		
		
		emailService.mailSendWithMemberKey(memberVo.getMember_email(),memberVo.getMember_id(), request);

		memberService.join(memberVo);
		
		return "redirect:/";
	}
	
	@GetMapping("/login.do")
	public String login() {
		return "member/login";
	}
	
	/*
	 * @PostMapping("/loginProcess.do") public String loginProcess(MemberVo
	 * memberVo, HttpServletRequest request) { //占쎌뒄筌ｏ옙筌띲끋釉⑨옙�뵠 占쎌뿳占쎈뮉 筌롫뗄�꺖占쎈굡占쎌벥 筌띲끆而삭퉪占쏙옙�땾占쎈퓠 Vo占쎄돌 占쎌쁽獄쏅�寃�占쎌삋占쎈뮞揶쏉옙 占쎌뿳占쎈뮉
	 * 野껋럩�뒭 占쎌읈占쎈뼎占쎈쭆 揶쏅�れ뱽 域뱄옙 揶쏆빘猿쒙옙肉� 筌띲끋釉⑨옙�뻻�녹뮇夷� //占쎌뵠占쎌쑎占쎈립 揶쏆빘猿쒐몴占� �뚣끇�렎占쎈굡 揶쏆빘猿쒙옙�뵬�⑨옙 占쎈맙.
	 * 
	 * HashMap<String, Long> resultMap=memberService.login(memberVo); long
	 * member_auth = resultMap.get("member_auth");//占쎌돳占쎌뜚占쎌뵥筌앾옙 long member_grade =
	 * resultMap.get("member_grade");//占쎌돳占쎌뜚占쎈쾻疫뀐옙
	 * 
	 * String viewPage = null; if(member_auth==1) { HttpSession session =
	 * request.getSession(); session.setAttribute("member_id",
	 * memberVo.getMember_id());//占쎌돳占쎌뜚占쎌뵥筌앾옙 �빊遺쏙옙 session.setAttribute("member_grade",
	 * member_grade);//占쎌돳占쎌뜚占쎈쾻疫뀐옙 �빊遺쏙옙 viewPage = "redirect:/home.do";
	 * 
	 * }else{ viewPage = "member/login"; }
	 * 
	 * return viewPage; }
	 */
	
	@PostMapping("/loginProcess.do")
	public String loginProcess(@RequestParam("member_id") String member_id,
			 					@RequestParam("member_pw") String member_pw, 
			 					HttpServletRequest request) {

		//2揶쏆뮇�벥 占쎌읈占쎈뼎揶쏅�れ뱽 HashMap揶쏆빘猿쒙옙肉� 占쏙옙占쎌삢占쎈퉸占쎄퐣 MyBatis 占쎌뿯占쎌젾揶쏅�れ몵嚥∽옙 占쎄텢占쎌뒠
		HashMap<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("member_id", member_id);
		loginInfo.put("member_pw", member_pw);
		
		//2揶쏆뮇�벥 野껉퀗�궢揶쏅�れ뱽 占쎈섯�⑥쥙�쁽 HashMap 揶쏆빘猿� 占쎄텢占쎌뒠
		HashMap<String, Long> resultMap=memberService.login(loginInfo);
		long member_auth = resultMap.get("member_auth");//占쎌돳占쎌뜚占쎌뵥筌앾옙
		long member_grade = resultMap.get("member_grade");//占쎌돳占쎌뜚占쎈쾻疫뀐옙
		long midx = resultMap.get("midx");
		
		String viewPage = null;
		if(member_auth==1) {
			HttpSession session = request.getSession();
			session.setAttribute("member_id", member_id);//占쎌돳占쎌뜚占쎌뵥筌앾옙 �빊遺쏙옙	
			session.setAttribute("member_grade", member_grade);//占쎌돳占쎌뜚占쎈쾻疫뀐옙 �빊遺쏙옙
			session.setAttribute("midx", midx);
			viewPage = "redirect:/index.do";
		
		}else{
			viewPage = "member/login";
		}
		
		return viewPage;
	}
	
	@GetMapping("/memberInfo.do")
	public String memberInfo(Model model, HttpServletRequest request) {
		//占쎌돳占쎌뜚占쎌젟癰귣�占쏙옙 揶쏉옙占쎌죬占쎌궎疫뀐옙 占쎌맄占쎈퉸 占쎄쉭占쎈�▼첎�빘猿쒙옙肉� 占쏙옙占쎌삢占쎈쭆 member_id 占쎌뵠占쎌뒠
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		MemberVo memberVo = memberService.getMemberInfo(member_id);
		//Spring MVC占쎈퓠占쎄퐣 Controller占쎈퓠占쎄퐣 占쎄문占쎄쉐占쎈┷占쎈뮉 Model揶쏆빘猿쒙옙�뮉 �뀎怨뺣뼊(JSP占쎈읂占쎌뵠筌욑옙)占쎈퓠占쎄퐣 筌〓챷�� 揶쏉옙占쎈뮟
		model.addAttribute("memberVo", memberVo);
		
		return "member/memberInfo";
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/index.do";
	}
	@GetMapping("/authSucess.do")
	public String key_alterConfirm(@RequestParam("member_id") String member_id, @RequestParam("member_key") String key) {
		emailService.alter_memberKey_service(member_id, key);
		
		return "member/joinSucess";
	}
}
