package jspexp.vo;

public class Player {
	private String tname;
	private String name;
	private double record;
	public Player() {
		// TODO Auto-generated constructor stub
	}
	public Player(String tname, String name, double record) {
		this.tname = tname;
		this.name = name;
		this.record = record;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getRecord() {
		return record;
	}
	public void setRecord(double record) {
		this.record = record;
	}
	
}
