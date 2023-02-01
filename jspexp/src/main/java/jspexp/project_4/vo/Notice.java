package jspexp.project_4.vo;

public class Notice {
	private int no;
	private String title;
	private String contents;
	private String date;
	private int views;

	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(String title) {
		this.title = title;
	}

	public Notice(int no, String title, String date, int views) {
		this.no = no;
		this.title = title;
		this.date = date;
		this.views = views;
	}

	public Notice(int no, String title, String contents, String date, int views) {
		this.no = no;
		this.title = title;
		this.contents = contents;
		this.date = date;
		this.views = views;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

}
