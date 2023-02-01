package javaexp.project_2.vo;

public class Library_Book {
	private int bnumber;
	private String isbn;
	private String bname;
	private String writer;
	private String publisher;
	private String cont;
	private String possible;
	public Library_Book() {
		// TODO Auto-generated constructor stub
	}
	public Library_Book(String possible) {
		this.possible = possible;
	}
	public Library_Book(int bnumber) {
		this.bnumber = bnumber;
	}
	public Library_Book(int bnumber, String bname) {
		this.bnumber = bnumber;
		this.bname = bname;
	}
	public Library_Book(String isbn, String bname, String writer, String publisher, String cont) {
		this.isbn = isbn;
		this.bname = bname;
		this.writer = writer;
		this.publisher = publisher;
		this.cont = cont;
	}
	public Library_Book(int bnumber, String isbn, String bname, String writer, String publisher, String cont,
			String possible) {
		this.bnumber = bnumber;
		this.isbn = isbn;
		this.bname = bname;
		this.writer = writer;
		this.publisher = publisher;
		this.cont = cont;
		this.possible = possible;
	}
	public int getBnumber() {
		return bnumber;
	}
	public void setBnumber(int bnumber) {
		this.bnumber = bnumber;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getPossible() {
		return possible;
	}
	public void setPossible(String possible) {
		this.possible = possible;
	}
	
	
}
