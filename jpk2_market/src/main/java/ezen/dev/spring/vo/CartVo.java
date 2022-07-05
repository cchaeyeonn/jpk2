package ezen.dev.spring.vo;

public class CartVo {
	private int pbidx;
	private String P_check;
	private int p_amount;
	private int midx_mc;
	private int pidx_pc;
	
	
	public int getPbidx() {
		return pbidx;
	}
	public void setPbidx(int pbidx) {
		this.pbidx = pbidx;
	}
	public String getP_check() {
		return P_check;
	}
	public void setP_check(String p_check) {
		P_check = p_check;
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
