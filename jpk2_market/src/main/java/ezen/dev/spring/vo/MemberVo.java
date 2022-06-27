package ezen.dev.spring.vo;

import java.util.Date;

public class MemberVo {
	private int member_idx;
	private String member_id;
	private String member_name;
	private String member_pw;
	private String member_phone;
	private Date member_regdate;
	
	private int member_grade;
	private String member_delyn;
	private Date member_deldate;
	
	public Date getMember_regdate() {
		return member_regdate;
	}
	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}
	public int getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(int member_grade) {
		this.member_grade = member_grade;
	}
	public String getMember_delyn() {
		return member_delyn;
	}
	public void setMember_delyn(String member_delyn) {
		this.member_delyn = member_delyn;
	}
	public Date getMember_deldate() {
		return member_deldate;
	}
	public void setMember_deldate(Date member_deldate) {
		this.member_deldate = member_deldate;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	

}
