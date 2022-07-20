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
	

	//qna 글쓰기
	@GetMapping("/qna_write.do")
	public String qna_write() {
		
		return "service_center/qna_write";
	}
	
	
	//qna 글쓰기 과정
		@PostMapping("/qna_writeProcess.do")
		public String qna_writeProcess(
				String q_category, String q_title, String q_content, String q_writedate, Integer q_originqidx, Integer q_depth, Integer midx_mq, Model model, HttpServletRequest request)
						throws IllegalStateException, IOException {
				
			HttpSession session = request.getSession(); //세션 사용
				
			int result=0;
			
			midx_mq=Integer.parseInt(String.valueOf(session.getAttribute("midx")));
			
			QnaVo qnaVo = new QnaVo(); //notice라는 이름으로 메모리에 공간을 할당
			qnaVo.setQ_category(q_category);
			qnaVo.setQ_title(q_title);
			qnaVo.setQ_content(q_content);
			qnaVo.setQ_writedate(q_writedate);
			/* qnaVo.setQ_originqidx(q_originqidx); */
			qnaVo.setQ_depth(q_depth);
			qnaVo.setMidx_mq(midx_mq);
			

			result = qnaService.insertQna(qnaVo);
			String viewPage="service_center/qna_write";

			if(result ==1) {
				model.addAttribute("q_category",q_category);
				model.addAttribute("q_title",q_title);
				model.addAttribute("q_content",q_content);
				model.addAttribute("q_writedate",q_writedate);
				/* model.addAttribute("q_originqidx",q_originqidx); */
				model.addAttribute("midx",midx_mq);
				model.addAttribute("q_depth",q_depth);
				viewPage = "redirect:/qna_board.do";
				
			}
			return viewPage;
		}
	
	
	
	
	
	
}
