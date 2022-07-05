package ezen.dev.spring.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	@GetMapping("/memberList.do")
	public String getMemberList(Model model) {
		
		List<MemberVo> memberList = adminService.getMemberList();

		model.addAttribute("memberList",memberList);
		
		return "admin/admin_memberList";
	}
	
	@GetMapping("/productAdd.do")
	public String adminProductAdd() {
		
		return "admin/admin_product_add";
	}
	
	@PostMapping("/addProductProcess.do")
	public String productAddProcess(@RequestParam("p_filename") MultipartFile uploadFile,
			String p_name, String p_price, String p_unit, String p_weight, String p_delivery,
			String p_package, String p_allergy, String p_limitdate, String p_type, String p_tag,
			Integer midx_mp , Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		
		HttpSession session = request.getSession();
		String p_filename = uploadFile.getOriginalFilename();
		
		int dot_idx = p_filename.lastIndexOf(".");
		String fileName1 = p_filename.substring(0, dot_idx);
		String extension = p_filename.substring(dot_idx+1);
		String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
		String p_system_filename = fileName2+"."+extension;
		String upload_dir = "/resources/product_image/";
		String realPath = request.getServletContext().getRealPath(upload_dir);
		String fullPath = realPath+p_system_filename;
		uploadFile.transferTo(new File(fullPath));
		int result=0;
		
		midx_mp=Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		
		ProductVo productVo = new ProductVo();
		productVo.setP_name(p_name);
		productVo.setP_price(p_price);
		productVo.setP_unit(p_unit);
		productVo.setP_weight(p_weight);
		productVo.setP_delivery(p_delivery);
		productVo.setP_package(p_package);
		productVo.setP_allergy(p_allergy);
		productVo.setP_limitdate(p_limitdate);
		productVo.setP_type(p_type);
		productVo.setP_tag(p_tag);
		productVo.setMidx_mp(midx_mp);
		productVo.setP_filename(p_filename);
		productVo.setP_system_filename(p_system_filename);

		result = adminService.addProduct(productVo);
		String viewPage="admin/admin_product_add";

		if(result ==1) {
			model.addAttribute("p_name",p_name);
			model.addAttribute("p_price",p_price);
			model.addAttribute("p_unit",p_unit);
			model.addAttribute("p_weight",p_weight);
			model.addAttribute("p_delivery",p_delivery);
			model.addAttribute("p_package",p_package);
			model.addAttribute("p_allergy",p_allergy);
			model.addAttribute("p_limitdate",p_limitdate);
			model.addAttribute("p_type",p_type);
			model.addAttribute("p_tag",p_tag);
			model.addAttribute("midx",midx_mp);
			model.addAttribute("p_filename",p_filename);
			model.addAttribute("p_system_filename",p_system_filename);
			viewPage = "admin/admin_home";
		}
		System.out.println("midx"+midx_mp);
		return viewPage;
	}
	
}
