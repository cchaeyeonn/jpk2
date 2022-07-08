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
	
	
	
	
	
	
}
