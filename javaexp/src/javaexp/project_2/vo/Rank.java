package javaexp.project_2.vo;

public class Rank {
	private String id;
	private int count;
	private String date;
	private int bnumber;
	public Rank() {
		// TODO Auto-generated constructor stub
	}
	public int getBnumber() {
		return bnumber;
	}
	public void setBnumber(int bnumber) {
		this.bnumber = bnumber;
	}
	public Rank(int bnumber) {
		this.bnumber = bnumber;
	}
	public Rank(String id) {
		this.id = id;
	}
	public Rank(String id, int count, String date) {
		this.id = id;
		this.count = count;
		this.date = date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
