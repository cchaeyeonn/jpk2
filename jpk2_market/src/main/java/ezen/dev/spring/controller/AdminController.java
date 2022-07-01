package ezen.dev.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ezen.dev.spring.service.AdminService;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.ProductVo;

@Controller
public class AdminController {
	
	private AdminService adminService;
	
	@Autowired //�옄�룞 �쓽議� 二쇱엯: �깮�꽦�옄 諛⑹떇
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@GetMapping("/admin.do")//get諛⑹떇 �슂泥� 泥섎━
	public String adminHome() {
		return "admin/admin_home";
	}
	
	@GetMapping("/memberList.do")//get諛⑹떇 �슂泥� 泥섎━
	public String getMemberList(Model model) {
		
		List<MemberVo> memberList = adminService.getMemberList();
		//紐⑤뜽媛앹껜�뿉 �쉶�썝紐⑸줉�쓣 異붽��븿
		model.addAttribute("memberList",memberList);
		
		return "admin/admin_memberList";
	}
	@GetMapping("/productAdd.do")//get諛⑹떇 �슂泥� 泥섎━
	public String adminProductAdd() {
		return "admin/admin_product_add";
	}
	@PostMapping("/productAddProcess.do")
	public String productAddProcess(ProductVo productVo) {
		
		int result=adminService.productAddProcess(productVo);
		
		String viewPage = null;
		if(result==1) {
			viewPage = "redirect:/admin.do";
		}else{
			viewPage = "admin/admin_product_add";
		}
		
		return viewPage;
	}
	
}
