package oliveyoung.vo;

import java.util.Date;

public class OvMember {
	private String id;
	private String pass;
	private String name;
	private String auth;
	private String address;
	private Date joindate;
	private Date birthday;
	private String phone;
	private String email;
	private int point;
	public OvMember() {
		// TODO Auto-generated constructor stub
	}
	public OvMember(String id, String pass, String name, String auth, String address, Date joindate, Date birthday,
			String phone, String email, int point) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.auth = auth;
		this.address = address;
		this.joindate = joindate;
		this.birthday = birthday;
		this.phone = phone;
		this.email = email;
		this.point = point;
	}
	public OvMember(String auth) {
		super();
		this.auth = auth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
}
