package springweb.z01_vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class FileRep {
	private int no;
	private String title;
	private String path;
	private String tempfile;
	private String fname;
	private String etc;
	private Date regdte;
	private Date uptdte;
	private MultipartFile report;
	public FileRep() {
		// TODO Auto-generated constructor stub
	}
	public FileRep(int no, String title, String path, String tempfile, String fname, String etc, Date regdte,
			Date uptdte, MultipartFile report) {
		super();
		this.no = no;
		this.title = title;
		this.path = path;
		this.tempfile = tempfile;
		this.fname = fname;
		this.etc = etc;
		this.regdte = regdte;
		this.uptdte = uptdte;
		this.report = report;
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
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getTempfile() {
		return tempfile;
	}
	public void setTempfile(String tempfile) {
		this.tempfile = tempfile;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public Date getRegdte() {
		return regdte;
	}
	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}
	public Date getUptdte() {
		return uptdte;
	}
	public void setUptdte(Date uptdte) {
		this.uptdte = uptdte;
	}
	public MultipartFile getReport() {
		return report;
	}
	public void setReport(MultipartFile report) {
		this.report = report;
	}
	
}
