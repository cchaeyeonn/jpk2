package ezen.dev.spring.controller;


import java.util.ArrayList;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.dev.spring.service.CartService;
import ezen.dev.spring.service.MemberService;
import ezen.dev.spring.service.ProductService;
import ezen.dev.spring.vo.MemberVo;

@Controller
public class MemberController {
	
	private MemberService memberService;
	
	
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	private CartService cartService;
	
	@Autowired
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
		
	} 
	
    @Inject
    PasswordEncoder passwordEncoder;
    
	@GetMapping("/join.do")
	public String join() {
		return "member/join";
	}
	
	
	@PostMapping("/joinProcess.do")
	public String joinProcess(MemberVo memberVo, RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>window.onload = function(){alert('인증메일이 발송되었습니다. 가입시 작성한 이메일을 확인해주세요.'); location.href='/spring/login.do';}</script>");
		out.flush();
		memberService.join(memberVo);
		return null;
	}
	
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(@RequestParam("authkey") String authKey,
			Model model, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
		System.out.println("authKey"+authKey);
		if(authKey == null) {
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>window.onload = function(){alert('인증키가 잘못되었습니다. 다시 인증해주세요.'); location.href='/spring/';}</script>");
			out.flush();
			return null;
		}
		MemberVo memberVo = memberService.userAuth(authKey);
		if(memberVo == null) {
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>window.onload = function(){alert('잘못된 접근입니다. 다시 인증해주세요.'); location.href='/spring/';}</script>");
			out.flush();
			return null;
		}
		model.addAttribute("member_name",memberVo.getMember_name());
		return "member/joinSucess";
	}
	 
	@GetMapping("/login.do")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/loginProcess.do")
	public String loginProcess(@RequestParam("member_pw") String member_pw, @RequestParam("member_id") String member_id, 
			 					HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		MemberVo memberVo=memberService.login(member_id);
		
		if(memberVo == null) {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>window.onload = function(){alert('올바르지 않은 접근입니다. 아이디 및 비밀번호를 확인해주세요.'); location.href='/spring/login.do';}</script>");
		out.flush();
		return null;
		}
		
		
		long member_grade = memberVo.getMember_grade();
		long midx = memberVo.getMidx();
		//Long형을 int형으로 변환
		int midx_ = (int)midx;


		//장바구니 정보 추가(한 매핑안에서 두개의 메소드가 진행되도록 구현)
		int count = cartService.cart_count(midx_);

		
		//상품번호를 배열에 담아 세션에 저장
		ArrayList<Integer> pidx_pc_arr = new ArrayList<Integer>();
		pidx_pc_arr = cartService.cart_pidx_pc(midx_);
		

		String member_auth = memberService.getAuthInfo(member_id);
		String member_name = memberService.getNameInfo(member_id);
		System.out.println("인증값 "+member_auth);
		if(passwordEncoder.matches(member_pw, memberVo.getMember_pw())) {
			
		
		if(member_pw.length()==6) {
			session.setAttribute("midx", midx);
			session.setAttribute("member_id", member_id);
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>window.onload = function(){alert('임시 비밀번호로 로그인하셨습니다. 비밀번호를 변경해주세요.'); location.href='/spring/updatePw.do';}</script>");
			out.flush();
			return null;
		}
		
		String Success="Y";
		if(member_auth.equals(Success)) {
			session.setAttribute("member_id", member_id);
			session.setAttribute("member_name", member_name);	
			session.setAttribute("member_grade", member_grade);
			session.setAttribute("midx", midx);
			session.setAttribute("result_", count);
			session.setAttribute("pidx_pc_arr", pidx_pc_arr);
			return "redirect:/index.do";
		}else{
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>window.onload = function(){alert('인증이 필요한 계정입니다. 가입시 작성한 이메일을 확인해주세요.'); location.href='/spring/login.do';}</script>");
			out.flush();
			session.invalidate();
			return null;
		}
		
		}else {
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>window.onload = function(){alert('잘못된 아이디 혹은 비밀번호입니다. 다시 확인해 주세요'); location.href='/spring/login.do';}</script>");
			out.flush();
		}
		return null;
	}
	

	
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/index.do";
	}
	
	@GetMapping("/findId.do")
	public String findId() {
		return "member/memberFindId";
	}
	
	@RequestMapping(value="/findIdProcess.do",  method = RequestMethod.POST)
	public String findIdProcess(@RequestParam("member_name") String member_name, @RequestParam("member_email") String member_email, Model model) {
	HashMap<String, String> findId = new HashMap<String, String>();
	findId.put("member_name", member_name);
	findId.put("member_email", member_email);
	MemberVo memberVo = memberService.getIdInfo(findId);
	if(memberVo==null) {
		return "member/memberFindIdFail";
	}
	model.addAttribute("memberVo",memberVo);
	return "member/memberFindIdResult";
	}
	
	@GetMapping("/findPw.do")
	public String findPw() {
		return "member/memberFindPw";
	}
	
	@RequestMapping(value="/findPwProcess.do",  method = RequestMethod.POST)
	public String findPwProcess(MemberVo memberVo, HttpServletRequest request, @RequestParam("member_name") String member_name) throws Exception {
	memberVo.setMember_name(member_name);
	int set = memberService.setTempPw(memberVo);
	if (set==0) {
		return "member/memberFindPwFail";
	}
	return "member/memberFindPwResult";
	}
	
	@GetMapping("/updatePw.do")
	public String updatePw() {
		return "member/memberUpdatePw";
	}
	
	@GetMapping("/memberInfo.do")
	public String memberInfo(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		MemberVo memberVo = memberService.getMemberInfo(member_id);
		model.addAttribute("memberVo", memberVo);
		
		return "member/memberInfo";
	}
	
	@PostMapping("/updatePwProcess.do")
	public String updatePwProcess(@RequestParam("member_pw1") String member_pw, MemberVo memberVo, Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
	HttpSession session = request.getSession();
	Integer midx_ =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
	String encodedPassword =passwordEncoder.encode(member_pw);
	memberVo.setMember_pw(encodedPassword);
	memberVo.setMidx(midx_);
	memberService.setUpdatePw(memberVo);
	response.setContentType("text/html; charset=UTF-8");
	response.setCharacterEncoding("UTF-8");
	PrintWriter out=response.getWriter();
	out.println("<script>window.onload = function(){alert('비밀번호가 변경되었습니다. 다시 로그인 해주세요.'); location.href='/spring/login.do';}</script>");
	out.flush();
	session.invalidate();

	return null;
	}
	
	
	@PostMapping("/updateMemberInfoProcess.do")
	public String updateMemberInfoProcess(@RequestParam(value="member_pw1", required=false) String member_pw, @RequestParam("member_phone") String member_phone,
			@RequestParam("member_addrcode") String member_addrcode, @RequestParam("member_addr1") String member_addr1, 
			@RequestParam("member_addr2") String member_addr2, @RequestParam("member_birth") String member_birth, @RequestParam("member_gender") String member_gender, 
			MemberVo memberVo, Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
	HttpSession session = request.getSession();
	Integer midx_ =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
	if(member_pw!="") {
	String encodedPassword =passwordEncoder.encode(member_pw);
	memberVo.setMember_pw(encodedPassword);
	memberVo.setMidx(midx_);
	memberVo.setMember_phone(member_phone);
	memberVo.setMember_addrcode(member_addrcode);
	memberVo.setMember_addr1(member_addr1);
	memberVo.setMember_addr2(member_addr2);
	memberVo.setMember_birth(member_birth);
	memberVo.setMember_gender(member_gender);
	memberService.setUpdatePw(memberVo);
	memberService.setUpdateMemberInfo(memberVo);
	response.setContentType("text/html; charset=UTF-8");
	response.setCharacterEncoding("UTF-8");
	PrintWriter out=response.getWriter();
	out.println("<script>window.onload = function(){alert('회원정보가 변경되었습니다. 다시 로그인 해주세요.'); location.href='/spring/login.do';}</script>");
	out.flush();
	session.invalidate();
	return null;
	}else{
	memberVo.setMidx(midx_);
	memberVo.setMember_phone(member_phone);
	memberVo.setMember_addrcode(member_addrcode);
	memberVo.setMember_addr1(member_addr1);
	memberVo.setMember_addr2(member_addr2);
	memberVo.setMember_birth(member_birth);
	memberVo.setMember_gender(member_gender);
	memberService.setUpdateMemberInfo(memberVo);
	response.setContentType("text/html; charset=UTF-8");
	response.setCharacterEncoding("UTF-8");
	PrintWriter out=response.getWriter();
	out.println("<script>window.onload = function(){alert('회원정보가 변경되었습니다. 다시 로그인 해주세요.'); location.href='/spring/login.do';}</script>");
	out.flush();
	session.invalidate();
	return null;}
	
	
	
	
	}
	
	@GetMapping("/memberDelyn.do")
	public void memberDelyn(MemberVo memberVo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Integer midx_ =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		memberVo.setMidx(midx_);
		memberService.memberDelyn(memberVo);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>window.onload = function(){alert('회원탈퇴가 성공적으로 이루어졌습니다. 그동안 저희 홈페이지를 사랑해주셔서 감사합니다.'); location.href='/spring/index.do';}</script>");
		out.flush();
		session.invalidate();
	}
	
	
	
	

}
