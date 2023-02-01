package jspexp.a13_database.vo;

public class Salgrade {
	private double startgrade;
	private double endgrade;
	private int grade;
	private double losal;
	private double hisal;
	public Salgrade() {
		// TODO Auto-generated constructor stub
	}
	public Salgrade(double startgrade, double endgrade) {
		this.startgrade = startgrade;
		this.endgrade = endgrade;
	}
	public Salgrade(int grade, double losal, double hisal) {
		this.grade = grade;
		this.losal = losal;
		this.hisal = hisal;
	}
	public Salgrade(int startgrade, int endgrade, int grade, double losal, double hisal) {
		this.startgrade = startgrade;
		this.endgrade = endgrade;
		this.grade = grade;
		this.losal = losal;
		this.hisal = hisal;
	}
	public double getStartgrade() {
		return startgrade;
	}
	public void setStartgrade(double startgrade) {
		this.startgrade = startgrade;
	}
	public double getEndgrade() {
		return endgrade;
	}
	public void setEndgrade(double endgrade) {
		this.endgrade = endgrade;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public double getLosal() {
		return losal;
	}
	public void setLosal(double losal) {
		this.losal = losal;
	}
	public double getHisal() {
		return hisal;
	}
	public void setHisal(double hisal) {
		this.hisal = hisal;
	}
	
	
}
