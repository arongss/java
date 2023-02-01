package javaexp.project_2.vo;

public class Application {
	private String id;
	private String bookname;
	private String writer;
	public Application() {
		// TODO Auto-generated constructor stub
	}
	public Application(String id, String bookname, String writer) {
		this.id = id;
		this.bookname = bookname;
		this.writer = writer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
}
