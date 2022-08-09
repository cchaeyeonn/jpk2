package ezen.dev.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ezen.dev.spring.service.AdminService;
import ezen.dev.spring.vo.AdminVo;
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
		return "redirect:/adminProductList.do";
	}
	
	@GetMapping("/adminProductList.do")
	public String getProductList(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer midx =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		
		List<ProductVo> productList = adminService.getProductList(midx);

		model.addAttribute("productList",productList);
		
		return "admin/admin_productList";
	}
	@GetMapping("/admin_productDetail.do")
	public String getAdminProductDetail(Model model, HttpServletRequest request, @RequestParam("pidx") Integer pidx) {
		
		ProductVo productVo= adminService.getProductInfo(pidx);
		
		model.addAttribute("productVo", productVo);
		
		return "admin/admin_productDetail";
	}
	
	@GetMapping("/adminProductDelyn.do")
	public String delProduct(@RequestParam("pidx") Integer pidx, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer midx_mp =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		ProductVo productVo = new ProductVo();
		
		productVo.setMidx_mp(midx_mp);
		productVo.setPidx(pidx);
		adminService.delProduct(productVo);


		return "redirect:/adminProductList.do";
		
	}
	
	@PostMapping("/statistics.do")
	//jsp에 추가된 파일의 이름만 가져옴
	public String statistics(@RequestParam(value="begin_date", required=false) String begin_date,
			@RequestParam(value="end_date", required=false) String end_date,Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd");
		Calendar time = Calendar.getInstance();
		String year = String.valueOf(Calendar.getInstance().get(Calendar.YEAR));
		String enddate = format.format(time.getTime());
		String startdate = year+"-01-01";
		
		if(begin_date == null) {
			begin_date = startdate;

		};
		
		if(end_date ==null) {
			end_date = enddate;
			
		};
		HttpSession session = request.getSession();
		Integer midx_mp =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		AdminVo adminVo = new AdminVo();
		System.out.println("begin_date:"+begin_date);
		System.out.println("end_date:"+end_date);

		adminVo.setBegin_date(begin_date);
		adminVo.setEnd_date(end_date);
		adminVo.setMidx(midx_mp);
		
		
		List<AdminVo> statisticsList = adminService.getStatisticsList(adminVo);
		List<AdminVo> statisticsList2 = adminService.getStatisticsList2(adminVo);
		
		model.addAttribute("statisticsList",statisticsList);
		model.addAttribute("statisticsList2",statisticsList2);
		model.addAttribute("adminVo", adminVo);
		
		

		
		
		return "admin/admin_statistics";
	}
	
	@GetMapping("/adminProductCheck.do")
	public String getProductCheckList(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Integer member_grade =Integer.parseInt(String.valueOf(session.getAttribute("member_grade")));
		if(member_grade != 2) {
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>window.onload = function(){alert('권한이 없습니다.'); location.href='/spring/admin.do';}</script>");
			out.flush();
			return null;
		}else {
		List<ProductVo> productList = adminService.getProductCheck();
		model.addAttribute("productList",productList);
		
		return "admin/super_adminCheckList";}
	}
	
	@GetMapping("/adminProductDetail.do")
	public String product_Detail(@RequestParam Integer pidx, Model model, HttpServletRequest request){
		ProductVo productVo = adminService.getProductInfo(pidx);
		model.addAttribute("productVo",productVo);
		return "admin/super_adminProductDetail";
	}
	
	@GetMapping("/adminProductOk.do")
	public String adminProductOk(@RequestParam Integer pidx, HttpServletResponse response) throws IOException{
		int result = adminService.adminProductOk(pidx);
		if(result==1) {
		return "redirect:/adminProductCheck.do";}
		else
		{response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>window.onload = function(){alert('상품등록 중 오류가 발생했습니다. 다시 시도해 주세요'); location.href='/spring/adminProductCheck.do';}</script>");
		out.flush();
		return null;
		}
	}
	
	@GetMapping("/adminMemberList.do")
	public String getMemberList(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Integer member_grade =Integer.parseInt(String.valueOf(session.getAttribute("member_grade")));
		if(member_grade != 2) {
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>window.onload = function(){alert('권한이 없습니다.'); location.href='/spring/admin.do';}</script>");
			out.flush();
			return null;
		}else {
		List<MemberVo> memberList = adminService.getMemberList();
		model.addAttribute("memberList",memberList);
		
		return "admin/super_adminMemberList";}
	}
	@GetMapping("/adminMemberUp.do")
	public String adminMemberUp(@RequestParam("midx") Integer midx, HttpServletResponse response, @RequestParam("member_grade") Integer member_grade) throws IOException{
		if(member_grade==1) {
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>window.onload = function(){alert('이미 관리자입니다.'); location.href='/spring/adminMemberList.do';}</script>");
			out.flush();
			return null;	
		}
		int result = adminService.adminMemberUp(midx);
		if(result==1) {
		return "redirect:/adminMemberList.do";}
		else
		{response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>window.onload = function(){alert('관리자임명 중 오류가 발생했습니다. 다시 시도해 주세요'); location.href='/spring/adminMemberList.do';}</script>");
		out.flush();
		return null;
		}
		
	}
	@GetMapping("/adminMemberDelyn.do")
	public String adminMemberDelyn(@RequestParam Integer midx, HttpServletResponse response) throws IOException{
		int result = adminService.adminMemberDelyn(midx);
		if(result==1) {
		return "redirect:/adminMemberList.do";}
		else
		{response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>window.onload = function(){alert('회원정지 시도 중 오류가 발생했습니다. 다시 시도해 주세요'); location.href='/spring/adminMemberList.do';}</script>");
		out.flush();
		return null;
		}
	}
	@GetMapping("/superAdminProductDelyn.do")
	public String delAdminProduct(@RequestParam("pidx") Integer pidx, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer midx_mp =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		ProductVo productVo = new ProductVo();
		
		productVo.setMidx_mp(midx_mp);
		productVo.setPidx(pidx);
		adminService.delProduct(productVo);


		return "redirect:/adminProductCheck.do";
		
	}
	@GetMapping("/adminBuyerList.do")
	public String getBuyerList(@RequestParam("pidx") Integer pidx, Model model) {
		List<ProductVo> productList = adminService.getBuyerList(pidx);
		model.addAttribute("productList", productList);
		
		return "admin/admin_buyerList";
		
	}
	@GetMapping("/adminBuyerDetail.do")
	public String getBuyerDetail(@RequestParam("pidx") Integer pidx, @RequestParam("midx") Integer midx, @RequestParam("order_id") String order_id, Model model) {
		ProductVo pVo = new ProductVo();
		pVo.setPidx(pidx);
		pVo.setMidx(midx);
		pVo.setOrder_id(order_id);
		ProductVo productVo = adminService.getBuyerDetail(pVo);
		model.addAttribute("productVo", productVo);
		
		return "admin/admin_buyerDetail";
		
	}
}
