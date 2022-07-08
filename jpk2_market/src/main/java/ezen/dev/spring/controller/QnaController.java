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

import ezen.dev.spring.service.NoticeService;
import ezen.dev.spring.service.QnaService;
import ezen.dev.spring.vo.NoticeVo;
import ezen.dev.spring.vo.QnaVo;

@Controller
public class QnaController {
	
private QnaService qnaService;
	
	@Autowired
	public QnaController(QnaService qnaService) {
		this.qnaService = qnaService;
	}
	
	@GetMapping("/qna_board.do")
	public String service_center(Model model) {
		
		List<QnaVo> qnaList = qnaService.getQnaList();
		
		model.addAttribute("qnaList",qnaList);
		
		return "service_center/qna_board";
	}
	

	
	
	
	
	
	
	
}
