package ezen.dev.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import ezen.dev.spring.service.AdminService;
import ezen.dev.spring.vo.MemberVo;

@Controller
public class AdminController {
	
	private AdminService adminService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@GetMapping("/admin.do")//get방식 요청 처리
	public String adminHome() {
		return "admin/admin_home";
	}
	
	@GetMapping("/memberList.do")//get방식 요청 처리
	public String getMemberList(Model model) {
		
		List<MemberVo> memberList = adminService.getMemberList();
		//모델객체에 회원목록을 추가함
		model.addAttribute("memberList",memberList);
		
		return "admin/admin_memberList";
	}
	
	
	
}
