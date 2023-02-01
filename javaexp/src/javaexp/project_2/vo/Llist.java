package javaexp.project_2.vo;

import java.util.Date;

public class Llist {
	private String id;
	private int bnumber;
	private Date ldate;
	public Llist() {
		// TODO Auto-generated constructor stub
	}
	public Llist(String id, int bnumber) {
		this.id = id;
		this.bnumber = bnumber;
	}
	public Llist(String id, int bnumber, Date ldate) {
		this.id = id;
		this.bnumber = bnumber;
		this.ldate = ldate;
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
	public Date getLdate() {
		return ldate;
	}
	public void setLdate(Date ldate) {
		this.ldate = ldate;
	}
	
}
