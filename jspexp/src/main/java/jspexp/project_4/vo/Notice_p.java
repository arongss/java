package jspexp.project_4.vo;

public class Notice_p {
	private int noticeNo;
	private String title;
	private String contents;
	private String noticeDate;
	private int views;
	private String adminId;

	public Notice_p(int noticeNo, String title, String contents, String noticeDate, int views, String adminId) {
		this.noticeNo = noticeNo;
		this.title = title;
		this.contents = contents;
		this.noticeDate = noticeDate;
		this.views = views;
		this.adminId = adminId;
	}

	public Notice_p(String title, String contents) {
		this.title = title;
		this.contents = contents;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

}
