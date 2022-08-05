package ezen.dev.spring.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

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
	
	@Autowired
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@GetMapping("/admin.do")
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
	//jsp에 추가된 파일의 이름만 가져옴
	public String productAddProcess(@RequestParam("p_filename") MultipartFile uploadFile,
			String p_name, String p_price, String p_unit, String p_weight1, String p_weight2, String p_delivery,
			String p_package, String p_allergy, String p_limitdate, String p_type, String p_tag,
			Integer midx_mp , String p_secondname, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		
		HttpSession session = request.getSession();
		String p_filename = uploadFile.getOriginalFilename();
		
		int dot_idx = p_filename.lastIndexOf(".");
		//파일이름을 확장자와 나눔
		String fileName1 = p_filename.substring(0, dot_idx);
		String extension = p_filename.substring(dot_idx+1);
		//그러한 파일이름에 시간을 붙여 시스템 파일이름으로 재구성
		String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
		String p_system_filename = fileName2+"."+extension;
		String upload_dir = "resources/product_image/";
		
		//저장되는 실제경로
		String realPath = request.getServletContext().getRealPath(upload_dir);
		String fullPath = realPath+p_system_filename;
		uploadFile.transferTo(new File(fullPath));
		String p_weight = p_weight1+p_weight2;
		int result=0;
		
		//db에는 midx값이 unsigned이기 때문에 int가 아닌 integer를 사용함
		midx_mp=Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		//productVo에 담을 값을 전부 소환
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
		productVo.setP_secondname(p_secondname);
		//이를 맵퍼로 가져가 실행하고
		result = adminService.addProduct(productVo);
		String viewPage="admin/admin_product_add";

		if(result ==1) {
			//위를 성공하면 모델에 담는다
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
			model.addAttribute("p_secondname",p_secondname);
			viewPage = "admin/admin_home";
		}
		return viewPage;
	}
	@GetMapping("/adminProductList.do")
	public String getProductList(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer midx =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		
		List<ProductVo> productList = adminService.getProductList(midx);

		model.addAttribute("productList",productList);
		
		return "admin/admin_productList";
	}
	@GetMapping("/adminProductDelyn.do")
	public String delProduct(@RequestParam("pidx") Integer pidx, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer midx_mp =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		ProductVo productVo = new ProductVo();
		
		productVo.setMidx_mp(midx_mp);
		productVo.setPidx(pidx);
		adminService.delProduct(productVo);


		return "admin/admin_home";
		
	}
	
	
}
