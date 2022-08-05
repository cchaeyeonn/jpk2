package ezen.dev.spring.vo;

public class ProductSearchVo {
	private String searchName;
	private String searchType;
	
	public ProductSearchVo() {
		this.searchName="";
		this.searchType="";
	}

	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

}
