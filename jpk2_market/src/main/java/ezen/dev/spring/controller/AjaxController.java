package ezen.dev.spring.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ezen.dev.spring.service.AjaxService;
import ezen.dev.spring.service.CartService;
import ezen.dev.spring.service.MemberService;
import ezen.dev.spring.vo.CartVo;
import ezen.dev.spring.vo.MemberVo;



//@Controller
@RestController
public class AjaxController {
	
	private AjaxService ajaxService;
	
	@Autowired 
	public AjaxController(AjaxService ajaxService) {
		this.ajaxService = ajaxService;
	}
	
    private CartService cartService;
	
	@Autowired
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
		
	} 
	
	private MemberService memberService;
	
	@Autowired
	public void setMemberService(MemberService memberService){
		this.memberService = memberService;
	}
	
    @Inject
    PasswordEncoder passwordEncoder;
	
	@PostMapping("/checkId.do")
	public String checkId(@RequestParam("member_id") String id) {
		
		System.out.println("id:"+id);
		
		String result="N"; 
		
		if(id == null) {
			result="N"; 
			
		}else {
		
		int flag = ajaxService.checkId(id);
		
		if(flag == 1) result = "Y";
		}
		return result;
	}
	@PostMapping("/checkEmail.do")
	public String checkEmail(@RequestParam("member_email") String email) {
		
		System.out.println("email:"+email);
		
		String result="N";
		
		int flag = ajaxService.checkEmail(email);
		
		if(flag == 1) result = "Y";
		
		return result;
	}
	@PostMapping("/checkPw.do")
	public String checkPw(@RequestParam("now_pw") String pw, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String result="N"; 
		String member_id=(String) session.getAttribute("member_id");
		MemberVo memberVo = memberService.getMemberInfo(member_id);
		Integer midx_ =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		memberVo.setMidx(midx_);
		if(passwordEncoder.matches(pw, memberVo.getMember_pw())) {
		result = "Y";
		}
		return result;
	}
	
	@PostMapping("/cart_delete.do")
	public String cartDeleteInfo(@RequestParam("cart_idx_arr[]") List<Integer> cartidxList,HttpServletRequest request) {
		
		String result="N";//회원삭제 실패
		HttpSession session = request.getSession();
		int result_=Integer.parseInt(String.valueOf(session.getAttribute("result_")));
		int flag = ajaxService.deleteCartInfo(cartidxList);
		result_ = result_-flag;
		session.setAttribute("result_", result_);
		int midx_=Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		ArrayList<Integer> pidx_pc_arr = new ArrayList<Integer>();
		pidx_pc_arr = cartService.cart_pidx_pc(midx_);
		session.setAttribute("pidx_pc_arr", pidx_pc_arr);
		
		if(flag != 0) result = "Y";//회원삭제 성공
		
		return result;
	}
	@PostMapping("/cart_deleteOne.do")
	public String cartDeleteInfoOne(@RequestParam("pbidx") Integer pbidx,HttpServletRequest request) {
		HttpSession session = request.getSession();
		int result_=Integer.parseInt(String.valueOf(session.getAttribute("result_")));
		String result="N";//회원삭제 실패
		
		int flag = ajaxService.deleteCartInfoOne(pbidx);
		result_ = result_-flag;
		session.setAttribute("result_", result_);
		
		int midx_=Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		ArrayList<Integer> pidx_pc_arr = new ArrayList<Integer>();
		pidx_pc_arr = cartService.cart_pidx_pc(midx_);
		session.setAttribute("pidx_pc_arr", pidx_pc_arr);
		
		
		if(flag != 0) result = "Y";//회원삭제 성공
		
		return result;
	}
	@PostMapping("/cart_amount.do")
	public String cartDeleteOne(CartVo cartVo, 
			@RequestParam("number") Integer number,
			@RequestParam("midx_mc") Integer midx_mc,
			@RequestParam("pidx_pc") Integer pidx_pc,HttpServletRequest request) {
		
		
		String result="N";
		cartVo.setP_amount(number);
		cartVo.setMidx_mc(midx_mc);
		cartVo.setPidx_pc(pidx_pc);
		
		int flag = ajaxService.cart_amount(cartVo);
        if(flag == 1) result = "Y";
		
		return result;
	}

	
}
