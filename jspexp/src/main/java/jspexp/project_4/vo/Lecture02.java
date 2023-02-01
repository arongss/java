package jspexp.project_4.vo;

public class Lecture02 {
	/*
	 * lecNum NUMBER PRIMARY KEY, lecName varchar2(30), lecLoc varchar2(30), lecPlan
	 * varchar2(500), lecYear NUMBER, semester NUMBER, grade NUMBER, major
	 * varchar2(30), times varchar2(20), sort varchar2(20), class NUMBER, --학년
	 */
	private int lecNum;
	private String lecName;
	private String lecLoc;
	private String lecPlan;
	private int lecYear;
	private int semester; // 학기
	private int grade; // 학점
	private String major; // 학과
	private String times;
	private String sort; // 전공유무
	private int class_l; // 학년
	private String majorName;
	private String id;
	private String day;// 시간표 요일
	private int t01; // 시간표 시간1
	private int t02; // 시간표 시간2

	// lecNum,major,class,sort,lecName,lecLoc,times,grade
	public Lecture02() {
		// TODO Auto-generated constructor stub
	}

	public Lecture02(String times, String lecName) {
		this.lecName = lecName;
		this.times = times;
	}

	public Lecture02(String times) {
		this.times = times;
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

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public int getT01() {
		return t01;
	}

	public void setT01(int t01) {
		this.t01 = t01;
	}

	public int getT02() {
		return t02;
	}

	public void setT02(int t02) {
		this.t02 = t02;
	}

}
