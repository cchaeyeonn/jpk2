package ezen.dev.spring.vo;

public class ProductSearchVo {
	private String searchName;
	private String searchTag;
	private String searchType;
	
	public ProductSearchVo() {
		this.searchName="";
		this.searchTag="";
		this.searchType="";
	}

	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getSearchTag() {
		return searchTag;
	}
	public void setSearchTag(String searchTag) {
		this.searchTag = searchTag;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

}
