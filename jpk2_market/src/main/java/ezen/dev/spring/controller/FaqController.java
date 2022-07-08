package ezen.dev.spring.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ezen.dev.spring.service.FaqService;
import ezen.dev.spring.service.NoticeService;
import ezen.dev.spring.vo.FaqVo;
import ezen.dev.spring.vo.NoticeVo;

@Controller
public class FaqController {
	

private FaqService faqService;
	
	@Autowired
	public FaqController(FaqService faqService) {
		this.faqService = faqService;
	}
	
	
	@GetMapping("/faq_board.do")
	public String service_center(Model model) {
		
		List<FaqVo> faqList = faqService.getFaqList();
		
		model.addAttribute("faqList",faqList);
		
		return "service_center/faq_board";
	}
	

	
	
	
	
	
	
	
}
