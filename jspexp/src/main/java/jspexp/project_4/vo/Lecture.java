package jspexp.project_4.vo;

public class Lecture {
	private int lecNum;
	private String lecName;
	private String lecLoc;
	private String lecPlan;
	private int lecYear;
	private int semester;
	private int grade;
	private String major;
	private String times;
	private String sort;
	private int class_l;
	private String id;
	private int majorNo;
	private String lecEval;

	public Lecture() {
		// TODO Auto-generated constructor stub
	}

	public Lecture(int lecNum, String lecName, int grade, String sort, String lecEval, String id) {
		this.lecNum = lecNum;
		this.lecName = lecName;
		this.grade = grade;
		this.sort = sort;
		this.lecEval = lecEval;
		this.id = id;
	}

	public Lecture(int lecNum, String lecName, String lecLoc, String times, int grade, String lecPlan) {
		this.lecNum = lecNum;
		this.lecName = lecName;
		this.lecLoc = lecLoc;
		this.grade = grade;
		this.times = times;
		this.lecPlan = lecPlan;
	}

	public Lecture(int lecNum, String lecName, String lecLoc, String lecPlan, int lecYear, int semester, int grade,
			String major, String times, String sort, int class_l, String id, int majorNo) {
		this.lecNum = lecNum;
		this.lecName = lecName;
		this.lecLoc = lecLoc;
		this.lecPlan = lecPlan;
		this.lecYear = lecYear;
		this.semester = semester;
		this.grade = grade;
		this.major = major;
		this.times = times;
		this.sort = sort;
		this.class_l = class_l;
		this.id = id;
		this.majorNo = majorNo;
	}

	public String getLecEval() {
		return lecEval;
	}

	public void setLecEval(String lecEval) {
		this.lecEval = lecEval;
	}

	public int getLecNum() {
		return lecNum;
	}

	public void setLecNum(int lecNum) {
		this.lecNum = lecNum;
	}

	public String getLecName() {
		return lecName;
	}

	public void setLecName(String lecName) {
		this.lecName = lecName;
	}

	public String getLecLoc() {
		return lecLoc;
	}

	public void setLecLoc(String lecLoc) {
		this.lecLoc = lecLoc;
	}

	public String getLecPlan() {
		return lecPlan;
	}

	public void setLecPlan(String lecPlan) {
		this.lecPlan = lecPlan;
	}

	public int getLecYear() {
		return lecYear;
	}

	public void setLecYear(int lecYear) {
		this.lecYear = lecYear;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getClass_l() {
		return class_l;
	}

	public void setClass_l(int class_l) {
		this.class_l = class_l;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMajorNo() {
		return majorNo;
	}

	public void setMajorNo(int majorNo) {
		this.majorNo = majorNo;
	}

}
