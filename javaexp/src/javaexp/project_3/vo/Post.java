package javaexp.project_3.vo;

public class Post {
	private int pno;
	private String pcontents;
	private int likecnt;
	private int bno;
	private String id;
	public Post() {
		// TODO Auto-generated constructor stub
	}
	public Post(String id) {
		this.id = id;
	}
	public Post(int pno, String pcontents, int likecnt, int bno, String id) {
		this.pno = pno;
		this.pcontents = pcontents;
		this.likecnt = likecnt;
		this.bno = bno;
		this.id = id;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPcontents() {
		return pcontents;
	}
	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}
	public int getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
