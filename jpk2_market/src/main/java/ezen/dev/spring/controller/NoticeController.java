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

import ezen.dev.spring.service.MemberService;
import ezen.dev.spring.service.NoticeService;
import ezen.dev.spring.vo.NoticeVo;
import ezen.dev.spring.vo.ProductVo;

@Controller
public class NoticeController {
	
private NoticeService noticeService;
	
	@Autowired
	public NoticeController(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	@GetMapping("/notice_board.do")
	public String service_center(Model model) {
		
		List<NoticeVo> noticeList = noticeService.getNoticeList();
		
		model.addAttribute("noticeList",noticeList);
		
		return "service_center/notice_board";
	}
	
	
	
		@GetMapping("/notice_wirte.do")
	public String adminProductAdd() {
		
		return "service_center/notice_write";
	}
	
	
	/*@PostMapping("/notice_wirteProcess.do")
	public String productAddProcess(
			String n_category, String n_title, String n_content, String n_writedate, Integer mmidx_mn)
					throws IllegalStateException, IOException {

		
		String realPath = request.getServletContext().getRealPath(upload_dir);
		System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
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
		return viewPage;
	}*/
	
	
	
}
