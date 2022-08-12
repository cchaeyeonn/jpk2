package ezen.dev.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.dev.spring.service.AdminService;
import ezen.dev.spring.service.ProductService;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.ProductSearchVo;
import ezen.dev.spring.vo.ProductVo;

@Controller
public class ProductController {
	
	private ProductService productService;
	
	@Autowired 
	public ProductController(ProductService productService) {
		this.productService = productService;
	}
	

	@GetMapping("/product_detail.do")
	//requestparam으로 product_list.jsp에 뿌려진 pidx를 받아옴
	public String product_Detail(@RequestParam String pidx, Model model, HttpServletRequest request){
		//그러한 pidx값을 활용하여 해당하는 상품의 데이터 값을 받아옴
		ProductVo productVo = productService.getProductInfo(pidx);
		//그러한 값을 model에 담은뒤
		model.addAttribute("productVo",productVo);
		//product_detail에 뿌려줌
		return "product/product_detail";
	}

	
	@GetMapping("/productList.do")
	public String getProductList(Model model) {
		//product테이블에 있는 데이터를 리스트화 함
		List<ProductVo> productList = productService.getProductList();
		//그러한 리스트를 model에 담음
		model.addAttribute("productList",productList);
		//그러한 값을 product_list.jsp에 뿌려줌
		return "product/product_list";
		}
	
	@GetMapping("/productList_type.do")
	public String getProductList_type(Model model, @RequestParam("type") String p_type) {
		List<ProductVo> productList = productService.getProductListType(p_type);
		model.addAttribute("productList",productList);
		model.addAttribute("p_type",p_type);
		return "product/product_list_type";
	}
	
	@GetMapping("/productList_new.do")
	public String getProductList_new(Model model) {
		List<ProductVo> productList = productService.getProductListNew();
		model.addAttribute("productList",productList);
		return "product/product_list_new";
	}
	
	@GetMapping("/productList_best.do")
	public String getProductList_best(Model model) {
		List<ProductVo> productList = productService.getProductListBest();
		model.addAttribute("productList",productList);
		return "product/product_list_best";
	}
	
	@GetMapping("/searchProductList.do")
	public String getSearchProductList(Model model, @RequestParam(value="searchType", required=false) String searchType, @RequestParam(value="searchName", required=false) String searchName, ProductVo productVo) {
		ProductSearchVo productSearchVo = new ProductSearchVo();
		productSearchVo.setSearchType(searchType);
		productSearchVo.setSearchName(searchName);
		List<ProductVo> productList = productService.getSearchProductList(productSearchVo);
		if(productList.isEmpty()) {
			return "product/product_list_null";
		}else {
			model.addAttribute("productList",productList);
			model.addAttribute("searchName",searchName);
			return "product/product_list_search";
		}
	}
}

