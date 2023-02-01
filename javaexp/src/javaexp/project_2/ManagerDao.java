package javaexp.project_2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.project_2.vo.Application;
import javaexp.project_2.vo.Lending;
import javaexp.project_2.vo.Library_Book;
import javaexp.project_2.vo.Llist;
import javaexp.project_2.vo.Member;
import javaexp.project_2.vo.Rlist;

public class ManagerDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	Scanner sc = new Scanner(System.in);

	// 도서관리(추가)
	public void InsertBook(Library_Book ins) {
		String sql = "INSERT INTO LIBRARY_BOOK values(bnum_seq.nextval,?,?,?,?,?,'가능')";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getIsbn());
			pstmt.setString(2, ins.getBname());
			pstmt.setString(3, ins.getWriter());
			pstmt.setString(4, ins.getPublisher());
			pstmt.setString(5, ins.getCont());
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("roolback 에러:" + e1.getMessage());
			}
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}

	public void RunInsertBook() {
		System.out.println("# 신규 도서 등록 #");
		System.out.println("등록할 도서의 정보를 입력해주세요.");
		System.out.print("▶일련번호 : ");
		String isbn = sc.nextLine();
		System.out.print("▶도서명 : ");
		String bname = sc.nextLine();
		System.out.print("▶저자 : ");
		String writer = sc.nextLine();
		System.out.print("▶출판사 : ");
		String publisher = sc.nextLine();
		System.out.print("▶분류번호(000~900) : ");
		String cont = sc.nextLine();
		ManagerDao dao = new ManagerDao();
		dao.InsertBook(new Library_Book(isbn, bname, writer, publisher, cont));
		System.out.println("입력하신 도서를 등록하였습니다.");
	}

	// 도서관리(삭제)
	public void DeleteBook(int bnumber) {
		String sql = "DELETE FROM LIBRARY_BOOK WHERE bnumber = ?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bnumber);
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("roolback 에러:" + e.getMessage());
			}
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}

	public void RunDeleteBook() {
		System.out.println("# 등록 도서 삭제 #");
		System.out.println("삭제할 도서의 도서번호를 입력해주세요.");
		System.out.print("▶도서번호 : ");
		int bnumber = sc.nextInt();
		ManagerDao dao = new ManagerDao();
		dao.DeleteBook(bnumber);
		System.out.println(bnumber + "번의 도서가 삭제되었습니다.");
	}

	// 도서목록확인
	public List<Library_Book> BookList(Library_Book sch) {
		List<Library_Book> blist = new ArrayList<Library_Book>();
		String sql = "SELECT * FROM Library_Book";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				blist.add(new Library_Book(rs.getInt("bnumber"), rs.getString("isbn"), rs.getString("bname"),
						rs.getString("writer"), rs.getString("publisher"), rs.getString("cont"),
						rs.getString("possible")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return blist;
	}

	public void RunBookList() {
		ManagerDao dao = new ManagerDao();
		System.out.println("# 도서목록확인 #");
		System.out.println("도서번호\t일련번호\t\t도서명\t저자\t출판사\t분류번호\t대여가능여부");
		for (Library_Book m : dao.BookList(new Library_Book())) {
			System.out.print(m.getBnumber() + "\t");
			System.out.print(m.getIsbn() + "\t");
			System.out.print(m.getBname() + "\t");
			System.out.print(m.getWriter() + "\t");
			System.out.print(m.getPublisher() + "\t");
			System.out.print(m.getCont() + "\t");
			System.out.print(m.getPossible() + "\n");
		}
	}

	// 회원정보확인
	public List<Member> MemberList(Member sch) {
		List<Member> mlist = new ArrayList<Member>();
		String sql = "SELECT * \r\n" + "FROM MEMBER \r\n" + "WHERE auth = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getAuth());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				mlist.add(new Member(rs.getString("id"), rs.getString("password"), rs.getString("mname"),
						rs.getString("civilNum"), rs.getInt("point"), rs.getDate("jdate"), rs.getString("auth")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return mlist;
	}

	public void RunMemberList() {
		ManagerDao dao = new ManagerDao();
		System.out.println("# 회원조회 #");
		System.out.println("조회할 회원의 권한을 입력해주세요.");
		System.out.print("▶이용자/관리자 : ");
		String auth = sc.nextLine();
		System.out.println("아이디\t비밀번호\t이름\t주민번호\t\t포인트\t가입일/입사일\t권한");
		for (Member m : dao.MemberList(new Member(auth))) {
			System.out.print(m.getId() + "\t");
			System.out.print(m.getPassword() + "\t");
			System.out.print(m.getMname() + "\t");
			System.out.print(m.getCivilNum() + "\t");
			System.out.print(m.getPoint() + "\t");
			System.out.print(m.getJdate() + "\t");
			System.out.print(m.getAuth() + "\n");
		}
	}

	// 연체회원확인
	public List<Lending> ChargeList(Lending sch) {
		List<Lending> clist = new ArrayList<Lending>();
		String sql = "SELECT id, bnumber, ldate, (ldate+14)+extension*7 duedate, sysdate, extension,\r\n"
				+ "	CASE\r\n" + "	WHEN -1*ceil((ldate+14)-sysdate) > 0 THEN 'D+'||floor(sysdate-(ldate+14))\r\n"
				+ "	ELSE 'D'||-1*ceil((ldate+14)-sysdate) END days,\r\n" + "	CASE\r\n"
				+ "	WHEN 300*(floor(sysdate-(ldate+14))) < 0 THEN 0\r\n"
				+ "	ELSE 300*(floor(sysdate-(ldate+14)))\r\n" + "	end charge\r\n" + " FROM lending\r\n"
				+ " WHERE sysdate > ldate+14";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				clist.add(new Lending(rs.getString("id"), rs.getInt("bnumber"), rs.getDate("ldate"),
						rs.getInt("extension"), rs.getDate("duedate"), rs.getDate("sysdate"), rs.getString("days"),
						rs.getInt("charge")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return clist;
	}

	public void RunChargeList() {
		ManagerDao dao = new ManagerDao();
		System.out.println("# 연체회원확인 #");
		System.out.println("아이디\t도서번호\t대출일자\t\t연장횟수\t반납기한\t\t현재날짜\t\t남은일수\t연체료");
		for (Lending ch : dao.ChargeList(new Lending())) {
			System.out.print(ch.getId() + "\t");
			System.out.print(ch.getBnumber() + "\t");
			System.out.print(ch.getLdate() + "\t");
			System.out.print(ch.getExtension() + "\t");
			System.out.print(ch.getDuedate() + "\t");
			System.out.print(ch.getSysdate() + "\t");
			System.out.print(ch.getDays() + "\t");
			System.out.print(ch.getCharge() + "\n");
		}
	}

	// 대출현황확인
	public List<Lending> NowLendingList(Lending sch) {
		List<Lending> ldlist = new ArrayList<Lending>();
		String sql = "SELECT id, bnumber, ldate, (ldate+14)+extension*7 duedate, sysdate, extension,\r\n"
				+ "	CASE\r\n" + "	WHEN -1*ceil((ldate+14)-sysdate) > 0 THEN 'D+'||floor(sysdate-(ldate+14))\r\n"
				+ "	ELSE 'D'||-1*ceil((ldate+14)-sysdate) END days,\r\n" + "	CASE\r\n"
				+ "	WHEN 300*(floor(sysdate-(ldate+14))) < 0 THEN 0\r\n"
				+ "	ELSE 300*(floor(sysdate-(ldate+14)))\r\n" + "	end charge\r\n" + "FROM lending";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ldlist.add(new Lending(rs.getString("id"), rs.getInt("bnumber"), rs.getDate("ldate"),
						rs.getInt("extension"), rs.getDate("duedate"), rs.getDate("sysdate"), rs.getString("days"),
						rs.getInt("charge")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return ldlist;
	}

	public void RunNowLendingList() {
		ManagerDao dao = new ManagerDao();
		System.out.println("# 대출현황확인 #");
		System.out.println("아이디\t도서번호\t대출일자\t\t연장횟수\t반납기한\t\t현재날짜\t\t남은일수\t연체료");
		for (Lending ld : dao.NowLendingList(new Lending())) {
			System.out.print(ld.getId() + "\t");
			System.out.print(ld.getBnumber() + "\t");
			System.out.print(ld.getLdate() + "\t");
			System.out.print(ld.getExtension() + "\t");
			System.out.print(ld.getDuedate() + "\t");
			System.out.print(ld.getSysdate() + "\t");
			System.out.print(ld.getDays() + "\t");
			System.out.print(ld.getCharge() + "\n");
		}
	}

	// 대출내역확인
	public List<Llist> AllLList(Llist sch) {
		List<Llist> llist = new ArrayList<Llist>();
		String sql = "Select * from Llist";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				llist.add(new Llist(rs.getString("id"), rs.getInt("bnumber"), rs.getDate("ldate")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return llist;
	}

	public void RunAllLList() {
		ManagerDao dao = new ManagerDao();
		System.out.println("# 대출내역확인 #");
		System.out.println("아이디\t도서번호\t대출일자");
		for (Llist l : dao.AllLList(new Llist())) {
			System.out.print(l.getId() + "\t");
			System.out.print(l.getBnumber() + "\t");
			System.out.print(l.getLdate() + "\n");
		}
	}

	// 반납내역확인
	public List<Rlist> AllRList(Rlist sch) {
		List<Rlist> rlist = new ArrayList<Rlist>();
		String sql = "Select * from Rlist";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rlist.add(new Rlist(rs.getString("id"), rs.getInt("bnumber"), rs.getDate("rdate")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return rlist;
	}

	public void RunAllRList() {
		ManagerDao dao = new ManagerDao();
		System.out.println("# 반납내역확인 #");
		System.out.println("아이디\t도서번호\t반납일자");
		for (Rlist r : dao.AllRList(new Rlist())) {
			System.out.print(r.getId() + "\t");
			System.out.print(r.getBnumber() + "\t");
			System.out.print(r.getRdate() + "\n");
		}
	}

	// 도서신청확인
	public List<Application> ApplicationList(Application sch) {
		List<Application> alist = new ArrayList<Application>();
		String sql = "Select * from Application";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				alist.add(new Application(rs.getString("id"), rs.getString("bookname"), rs.getString("writer")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return alist;
	}

	public void RunApplicationList() {
		ManagerDao dao = new ManagerDao();
		System.out.println("# 도서신청확인 #");
		System.out.println("아이디\t도서명\t저자");
		for (Application a : dao.ApplicationList(new Application())) {
			System.out.print(a.getId() + "\t");
			System.out.print(a.getBookname() + "\t");
			System.out.print(a.getWriter() + "\n");
		}
	}

}
