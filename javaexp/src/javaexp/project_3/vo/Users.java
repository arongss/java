package javaexp.project_3.vo;

public class Users {
	private String id;
	private String pass;
	private String email;
	private String nickname;
	private String enterYear;
	private String university;
	public Users() {
		// TODO Auto-generated constructor stub
	}
	public Users(String id) {
		this.id = id;
	}
	public Users(String id, String pass) {
		this.id = id;
		this.pass = pass;
	}
	public Users(String pass, String email, String nickname) {
		this.pass = pass;
		this.email = email;
		this.nickname = nickname;
	}
	public Users(String id, String pass, String email, String nickname) {
		this.id = id;
		this.pass = pass;
		this.email = email;
		this.nickname = nickname;
	}
	public Users(String id, String pass, String email, String nickname, String enterYear, String university) {
		this.id = id;
		this.pass = pass;
		this.email = email;
		this.nickname = nickname;
		this.enterYear = enterYear;
		this.university = university;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEnterYear() {
		return enterYear;
	}
	public void setEnterYear(String enterYear) {
		this.enterYear = enterYear;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	
	
}
