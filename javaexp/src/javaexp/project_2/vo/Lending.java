package javaexp.project_2.vo;

import java.util.Date;

public class Lending {
	private String id;
	private int bnumber;
	private Date ldate;
	private int extension;
	private Date duedate;
	private Date sysdate;
	private String days;
	private int charge;
	public Lending() {
		// TODO Auto-generated constructor stub
	}
	public Lending(int bnumber, int extension) {
		this.bnumber = bnumber;
		this.extension = extension;
	}
	public Lending(int bnumber) {
		this.bnumber = bnumber;
	}
	public Lending(String id, int bnumber) {
		this.id = id;
		this.bnumber = bnumber;
	}
	public Lending(String id) {
		this.id = id;
	}
	public Lending(String id, int bnumber, Date ldate, Date duedate, Date sysdate, String days, int charge) {
		this.id = id;
		this.bnumber = bnumber;
		this.ldate = ldate;
		this.duedate = duedate;
		this.sysdate = sysdate;
		this.days = days;
		this.charge = charge;
	}
	public Lending(String id, int bnumber, Date ldate, int extension, Date duedate, Date sysdate, String days,
			int charge) {
		this.id = id;
		this.bnumber = bnumber;
		this.ldate = ldate;
		this.extension = extension;
		this.duedate = duedate;
		this.sysdate = sysdate;
		this.days = days;
		this.charge = charge;
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
	public int getExtension() {
		return extension;
	}
	public void setExtension(int extension) {
		this.extension = extension;
	}
	public Date getDuedate() {
		return duedate;
	}
	public void setDuedate(Date duedate) {
		this.duedate = duedate;
	}
	public Date getSysdate() {
		return sysdate;
	}
	public void setSysdate(Date sysdate) {
		this.sysdate = sysdate;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	
}
