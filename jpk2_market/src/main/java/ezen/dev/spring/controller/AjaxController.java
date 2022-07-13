package ezen.dev.spring.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ezen.dev.spring.service.AjaxService;

//Ajax�넻�떊 吏��썝�쓣 �쐞�빐 pom.xml�뿉 �쓽議대え�뱢(jackson)�쓣 異붽��빐 以�

//@Controller
@RestController //Spring4踰꾩쟾遺��꽣 吏��썝. @Controller + @ResponseBody 湲곕뒫
public class AjaxController {
	
	private AjaxService ajaxService;
	
	@Autowired 
	public AjaxController(AjaxService ajaxService) {
		this.ajaxService = ajaxService;
	}
	
	@PostMapping("/checkId.do")
	public String checkId(@RequestParam("member_id") String id) {
		
		System.out.println("id: "+id);
		
		String result="N"; 
		
		int flag = ajaxService.checkId(id);
		
		if(flag == 1) result = "Y";
		
		return result;
	}
	@PostMapping("/checkEmail.do")
	public String checkEmail(@RequestParam("member_email") String email) {
		
		System.out.println("email: "+email);
		
		String result="N";
		
		int flag = ajaxService.checkEmail(email);
		
		if(flag == 1) result = "Y";
		
		return result;
	}
	@PostMapping("/cart_delete.do")
	public String cartDeleteInfo(@RequestParam("cart_idx_arr[]") List<Integer> cartidxList) {
		
		String result="N";//회원삭제 실패
		
		int flag = ajaxService.deleteCartInfo(cartidxList);
		
		if(flag != 0) result = "Y";//회원삭제 성공
		
		return result;
	}
	@PostMapping("/cart_deleteOne.do")
	public String cartDeleteInfoOne(@RequestParam("pbidx") Integer pbidx) {
		
		String result="N";//회원삭제 실패
		
		int flag = ajaxService.deleteCartInfoOne(pbidx);
		
		if(flag != 0) result = "Y";//회원삭제 성공
		
		return result;
	}
	
	
	
}
