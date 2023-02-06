package board.vo;
// board.vo.BoardSch
public class BoardSch {
	private String subject;
	private String writer;
	public BoardSch() {
		// TODO Auto-generated constructor stub
	}
	public BoardSch(String subject, String writer) {
		super();
		this.subject = subject;
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
}
