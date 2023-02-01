package javaexp.project_2.vo;

public class Review {
	private String id;
	private int bnumber;
	private int score;
	private String contents;
	public Review() {
		// TODO Auto-generated constructor stub
	}
	public Review(int bnumber) {
		this.bnumber = bnumber;
	}
	public Review(String id, int bnumber, int score, String contents) {
		this.id = id;
		this.bnumber = bnumber;
		this.score = score;
		this.contents = contents;
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
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
}
