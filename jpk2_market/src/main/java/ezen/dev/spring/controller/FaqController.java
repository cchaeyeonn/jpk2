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
	

		@GetMapping("/faq_wirte.do")
	public String _write() {
			
			return "service_center/faq_write";
		}
		
	@PostMapping("/faq_writeProcess.do")
	public String faq_writeProcess(
			String f_category, String f_title, String f_content, Model model, HttpServletRequest request)
				throws IllegalStateException, IOException {
		
			HttpSession session = request.getSession();
			
			int result=0;
			
			FaqVo faqVo = new FaqVo();
			faqVo.setF_category(f_category);
			faqVo.setF_title(f_title);
			faqVo.setF_content(f_content);
			faqVo.setF_delyn(f_content);
			
			
			result = faqService.insertFaq(faqVo);
			String viewPage="service_center/faq_write";
			
			if(result ==1) {
				model.addAttribute("f_category",f_category);
				model.addAttribute("f_title",f_title);
				model.addAttribute("f_content",f_content);
				
				viewPage = "redirect:/service_center.do";
			
			}
			return viewPage;
			
		
	}
		@GetMapping("/faq_detail.do")
		public String faq_detail(@RequestParam ("fidx") String fidx, Model model, HttpServletRequest request){
			
			FaqVo faqVo = faqService.getFaqInfo(fidx);
			
			model.addAttribute("faqVo, faqVo");
			
			return "service_center/faq_detail";
			
		}

	
	
	
}
