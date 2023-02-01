package javaexp.project_2.vo;

import java.util.Date;

public class Member {
	private String id;
	private String password;
	private String mname;
	private String civilNum;
	private int point;
	private Date jdate;
	private String jdateS;
	private String auth;
	public Member() {
		// TODO Auto-generated constructor stub
	}
	public Member(String id, String password, String mname, String civilNum, String auth) {
		this.id = id;
		this.password = password;
		this.mname = mname;
		this.civilNum = civilNum;
		this.auth = auth;
	}
	public Member(String id, String password, String mname, String civilNum, int point, Date jdate, String auth) {
		this.id = id;
		this.password = password;
		this.mname = mname;
		this.civilNum = civilNum;
		this.point = point;
		this.jdate = jdate;
		this.auth = auth;
	}
	public Member(String id, String password, String mname, String civilNum, String jdateS, String auth) {
		this.id = id;
		this.password = password;
		this.mname = mname;
		this.civilNum = civilNum;
		this.jdateS = jdateS;
		this.auth = auth;
	}
	public Member(String auth) {
		this.auth = auth;
	}
	public Member(String id, String password, String auth) {
		this.id = id;
		this.password = password;
		this.auth = auth;
	}
	public Member(String id, String password) {
		this.id = id;
		this.password = password;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getCivilNum() {
		return civilNum;
	}
	public void setCivilNum(String civilNum) {
		this.civilNum = civilNum;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Date getJdate() {
		return jdate;
	}
	public void setJdate(Date jdate) {
		this.jdate = jdate;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getJdateS() {
		return jdateS;
	}
	public void setJdateS(String jdateS) {
		this.jdateS = jdateS;
	}
	
}
