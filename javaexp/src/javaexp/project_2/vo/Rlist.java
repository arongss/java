package javaexp.project_2.vo;

import java.util.Date;

public class Rlist {
	private String id;
	private int bnumber;
	private Date rdate;
	public Rlist() {
		// TODO Auto-generated constructor stub
	}
	public Rlist(String id, int bnumber) {
		this.id = id;
		this.bnumber = bnumber;
	}
	public Rlist(String id, int bnumber, Date rdate) {
		this.id = id;
		this.bnumber = bnumber;
		this.rdate = rdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBnumber() {
		return bnumber;
	}
	public void setBnumber(int bnumber) {
		this.bnumber = bnumber;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	
}
