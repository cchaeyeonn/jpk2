package ezen.dev.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ezen.dev.spring.service.MemberService;
import ezen.dev.spring.service.NoticeService;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.NoticeVo;
import ezen.dev.spring.vo.ProductVo;



@Controller	//클래스에 컨트롤러 어노테이션 추가
//컨트롤러의 역할을 수행한다고 명시(해당 클래스를 컨트롤러로 사용한다고 스프링 프레임워크에 알린다)
//필요한 비즈니스 로직을 호출하여 전달할 모델과 이동할 뷰 정보를 dispatherservlet에 반환
public class NoticeController {
	
private NoticeService noticeService;
	
	@Autowired	//객체생성 시점에 스프링 컨테이너에서 해당 스프링빈을 찾아서 주입
	public NoticeController(NoticeService noticeService) {
		this.noticeService = noticeService;	//생성자
	}
	
	private MemberService memberService;
	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	//공지사항 리스트
	@GetMapping("/notice_board.do")
	public String service_center(Model model) {
		
		List<NoticeVo> noticeList = noticeService.getNoticeList(); //서비스를 호출
		
		model.addAttribute("noticeList",noticeList); //(키,값)
		
		return "service_center/notice_board";
	}
	
	
	
	//공지사항 글쓰기
	@GetMapping("/notice_write.do")
	public String notice_write(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		Integer member_grade = Integer.parseInt(String.valueOf(session.getAttribute("member_grade")));
		
			if(member_grade != 2) {
				response.setContentType("text/html; charset=UTF-8");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>window.onload = function(){alert('권한이 없습니다.'); location.href='/spring/notice_board.do';}</script>");
				out.flush();
				return null;
		}
		
		
		return "service_center/notice_write";
	}
	
	
	//공지사항 글쓰기 과정
	@PostMapping("/notice_writeProcess.do")
	public String notice_writeProcess(
			String n_category, String n_title, String n_content, String n_writedate, Integer midx_mn, Model model, HttpServletRequest request)
					throws IllegalStateException, IOException {
			
		HttpSession session = request.getSession(); //세션 사용
			
		int result=0;
		
		midx_mn=Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		NoticeVo noticeVo = new NoticeVo(); //notice라는 이름으로 메모리에 공간을 할당
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
			viewPage = "redirect:/notice_board.do";
			
		}
		return viewPage;
	}
	
	
	//공지사항 자세히
	@GetMapping("/notice_detail.do")
	public String notice_detail(@RequestParam String nidx, Model model){ //@RequestParam을 이용해서 값을 받아옴
		
		
		//String nidx = (String)session.getAttribute("noticeVo.nidx");

		NoticeVo noticeVo = noticeService.noticedetail(nidx);
		
		model.addAttribute("noticeVo",noticeVo);
		
		return "service_center/notice_detail";
	}
	

	//공지사항 수정하기 이동
	@GetMapping("/notice_update.do")
	public String notice_modify(Model model, String nidx, HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		Integer member_grade = Integer.parseInt(String.valueOf(session.getAttribute("member_grade")));
			if(member_grade != 2) {
				response.setContentType("text/html; charset=UTF-8");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>window.onload = function(){alert('권한이 없습니다.'); location.href='/spring/notice_board.do';}</script>");
				out.flush();
				return null;
		}
		NoticeVo noticeVo = noticeService.noticedetail(nidx);
		model.addAttribute("noticeVo",noticeVo);
		return "service_center/notice_update";
	}
	
		
	//공지사항 수정
	@PostMapping("/notice_updateprocess.do")
	public String notice_updateprocess(@RequestParam String nidx, String n_category, String n_title, String n_content, Integer midx_mn, Model model, HttpServletRequest request){

		HttpSession session = request.getSession();
		
		int result=0;
		
		NoticeVo noticeVo = new NoticeVo();
		
		int nidx_ = Integer.parseInt( nidx);
		
		midx_mn=Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		
		 //notice라는 이름으로 메모리에 공간을 할당
		noticeVo.setN_title(n_title);
		noticeVo.setN_category(n_category);
		noticeVo.setN_content(n_content);
		noticeVo.setMidx_mn(midx_mn);
		noticeVo.setNidx(nidx_);
		

		result = noticeService.updateNotice(noticeVo);
		String viewPage="service_center/notice_update";

		if(result ==1) {
			model.addAttribute("n_title",n_title);
			model.addAttribute("n_category",n_category);
			model.addAttribute("n_content",n_content);
			model.addAttribute("midx",midx_mn);
			model.addAttribute("noticeVo",noticeVo);
			viewPage = "service_center/notice_detail";
			
		}
		return viewPage;
	}
	
	
	
	//공지사항 수정하기 process
/*	@PostMapping("/notice_updateprocess.do")
	public String notice_modifyprocess(Model model, String n_title,String n_content, Integer midx_mn, Model moel){
		noticeService.noticeupdate();
		
		HttpSession session = request.getSession(); //세션 사용
		model.addAttribute("result",noticeVo);
		return "redirect:service_center/notice_modify";
	}
	
	@PostMapping("/notice_updateprocess.do")
	public String notice_updateprocess(
			String n_category, String n_title, String n_content,Integer midx_mn, Model model, HttpServletRequest request)
					throws IllegalStateException, IOException {
		
			
		HttpSession session = request.getSession(); //세션 사용
			
		int result=0;
		
		midx_mn=Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		
		NoticeVo noticeVo = new NoticeVo(); //notice라는 이름으로 메모리에 공간을 할당
		noticeVo.setN_category(n_category);
		noticeVo.setN_title(n_title);
		noticeVo.setN_content(n_content);
		noticeVo.setMidx_mn(midx_mn);
		

		result = noticeService.updateNotice(noticeVo);
		String viewPage="service_center/notice_update";

		if(result ==1) {
			model.addAttribute("n_category",n_category);
			model.addAttribute("n_title",n_title);
			model.addAttribute("n_content",n_content);
			model.addAttribute("midx",midx_mn);
			viewPage = "redirect:/service_center.do";
			
		}
		return viewPage;
	}*/
			
	
	//공지사항 삭제하기
	@GetMapping("/notice_delyn.do")
	public String delNotice(@RequestParam("nidx") Integer nidx, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer midx_mn =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		NoticeVo noticeVo = new NoticeVo();
		
		noticeVo.setMidx_mn(midx_mn); 
		noticeVo.setNidx(nidx);
		noticeService.delNotice(noticeVo);

		return "redirect:/notice_board.do";
		
	}
	
	
	
	
	
	
}
