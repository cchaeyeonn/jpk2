package ezen.dev.spring.vo;


// 조인을 했다고 하더라도 Vo는 별개다. DB와 Class는 분리 되어있기 때문이다.

public class CartVo {
	private int pbidx;
	private String p_check;
	private int p_amount;
	private int midx_mc;
	private int pidx_pc;
	private String p_name;
	private String p_filename;
	private String p_price;
	private String p_system_filename;
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_filename() {
		return p_filename;
	}
	public void setP_filename(String p_filename) {
		this.p_filename = p_filename;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getP_system_filename() {
		return p_system_filename;
	}
	public void setP_system_filename(String p_system_filename) {
		this.p_system_filename = p_system_filename;
	}
	public int getPbidx() {
		return pbidx;
	}
	public void setPbidx(int pbidx) {
		this.pbidx = pbidx;
	}
	public String getP_check() {
		return p_check;
	}
	public void setP_check(String p_check) {
		this.p_check = p_check;
	}
	public int getP_amount() {
		return p_amount;
	}
	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}
	public int getMidx_mc() {
		return midx_mc;
	}
	public void setMidx_mc(int midx_mc) {
		this.midx_mc = midx_mc;
	}
	public int getPidx_pc() {
		return pidx_pc;
	}
	public void setPidx_pc(int pidx_pc) {
		this.pidx_pc = pidx_pc;
	}
	
}
