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
	public String notice_write() {
		
		return "service_center/notice_write";
	}
	
	
	@PostMapping("/notice_writeProcess.do")
	public String notice_writeProcess(
			String n_category, String n_title, String n_content, String n_writedate, Integer midx_mn, Model model, HttpServletRequest request)
					throws IllegalStateException, IOException {
			
			HttpSession session = request.getSession();
			
			int result=0;
		
		midx_mn=Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		
		NoticeVo noticeVo = new NoticeVo();
		noticeVo.setN_category(n_category);
		noticeVo.setN_title(n_title);
		noticeVo.setN_content(n_content);
		noticeVo.setN_writedate(n_writedate);
		noticeVo.setMidx_mn(midx_mn);
		

		result = noticeService.insertNotice(noticeVo);
		String viewPage="service_center/notice_write";

		if(result ==1) {
			model.addAttribute("n_category",n_category);
			model.addAttribute("n_title",n_title);
			model.addAttribute("n_content",n_content);
			model.addAttribute("n_writedate",n_writedate);
			model.addAttribute("midx",midx_mn);
			viewPage = "redirect:/service_center.do";
			
		}
		return viewPage;
	}
	
	@GetMapping("/notice_detail.do")
	public String notice_detail(@RequestParam ("nidx") Integer nidx, Model model, HttpServletRequest request){
		
		
//		String pidx = (String)session.getAttribute("productVo.pidx");

		NoticeVo noticeVo = noticeService.getNoticeInfo(nidx);
		
		model.addAttribute("NoticeVo",noticeVo);
		
		return "service_center/notice_detail";
	}
	
	
	
	
	
}
