package ezen.dev.spring.controller;


import java.util.ArrayList;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	
	@GetMapping("/join.do")
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value="/joinProcess.do", method = RequestMethod.POST)
	public String joinProcess(MemberVo memberVo, RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		memberService.join(memberVo);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>alert('가입하실 때 작성하신 이메일에서 인증을 해주세요.');</script>");
		out.flush();
		return "/";
	}
	
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(@RequestParam("authkey") String authKey,
			Model model, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
		System.out.println("authKey"+authKey);
		if(authKey == null) {
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('인증키가 잘못되었습니다. 다시 인증해주세요.');</script>");
			out.flush();
			return "/";
		}
		MemberVo memberVo = memberService.userAuth(authKey);
		if(memberVo == null) {
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('잘못된 접근입니다. 다시 인증해주세요.');</script>");
			out.flush();
			return "/";
		}
		model.addAttribute("member_name",memberVo.getMember_name());
		return "member/joinSucess";
	}
	 
	@GetMapping("/login.do")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/loginProcess.do")
	public String loginProcess(@RequestParam("member_id") String member_id,
			 					@RequestParam("member_pw") String member_pw, 
			 					HttpServletRequest request, HttpServletResponse response) throws IOException {
		HashMap<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("member_id", member_id);
		loginInfo.put("member_pw", member_pw);
		HashMap<String, Long> resultMap=memberService.login(loginInfo);
		if(resultMap.get("midx")==null) {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>alert('올바르지않은 정보입니다. 아이디 혹은 비밀번호를 확인해주세요.');</script>");
		out.flush();
		return "member/login";
		}
		
		long member_grade = resultMap.get("member_grade");
		long midx = resultMap.get("midx");

		//Long형을 int형으로 변환
		int midx_ = (int)midx;
		//장바구니 정보 추가(한 매핑안에서 두개의 메소드가 진행되도록 구현)
		int count = cartService.cart_count(midx_);

		
		//상품번호를 배열에 담아 세션에 저장
		ArrayList<Integer> pidx_pc_arr = new ArrayList<Integer>();
		pidx_pc_arr = cartService.cart_pidx_pc(midx_);
		

		String member_auth = memberService.getAuthInfo(member_id);
		System.out.println("인증값 "+member_auth);
		String Success="Y";
		if(member_auth.equals(Success)) {
			HttpSession session = request.getSession();
			session.setAttribute("member_id", member_id);	
			session.setAttribute("member_grade", member_grade);
			session.setAttribute("midx", midx);
			session.setAttribute("result_", count);
			session.setAttribute("pidx_pc_arr", pidx_pc_arr);
			return "redirect:/index.do";
			
		}else if(member_pw.length()==6) {
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('임시비밀번호로 로그인하셨습니다. 비밀번호를 변경해주세요');</script>");
			out.flush();
			return "member/memberUpdatePw";
		}else{
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('인증이 필요한 계정입니다. 가입시에 작성한 이메일을 확인해주세요.');</script>");
			out.flush();
			return "member/login";
		}
		
	}
	
	@GetMapping("/memberInfo.do")
	public String memberInfo(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		MemberVo memberVo = memberService.getMemberInfo(member_id);
		model.addAttribute("memberVo", memberVo);
		
		return "member/memberInfo";
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
	public String findPwProcess(MemberVo memberVo) throws Exception {
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
	
	
	@PostMapping("/updatePwProcess.do")
	public String updatePwProcess(@RequestParam("member_pw1") String member_pw,@RequestParam("now_pw") String now_pw, MemberVo memberVo, Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
	HttpSession session = request.getSession();
	Integer midx_ =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
	memberVo.setNow_pw(now_pw);
	memberVo.setMember_pw(member_pw);
	memberVo.setMidx(midx_);
	memberService.setUpdatePw(memberVo);
	response.setContentType("text/html; charset=UTF-8");
	response.setCharacterEncoding("UTF-8");
	PrintWriter out=response.getWriter();
	out.println("<script>alert('비밀번호가 변경되었습니다. 다시 로그인해주세요.');</script>");
	out.flush();
	session.invalidate();
	
	return "member/login";
	}
	
	
	
	

}
