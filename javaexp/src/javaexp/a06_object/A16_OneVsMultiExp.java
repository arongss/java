package javaexp.a06_object;

import java.util.ArrayList;

public class A16_OneVsMultiExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		OnTrain onSys = new OnTrain("온라인 기차 예매");
		onSys.setTlist(new Ticketing("서울-부산","1호차3B",42000));
		onSys.setTlist(new Ticketing("서울-목포","2호차3C",32000));
		onSys.setTlist(new Ticketing("대전-인천","3호차4B",40000));
		onSys.showList();
	}

}
// ex) 코레일예매시스템
//		OnTrain(시스템명, ArrayList<Ticketing>)
//		Ticketing(구간, 좌석, 비용)
class OnTrain{
	private String sysName;
	private ArrayList<Ticketing> tlist;
	public OnTrain(String sysName) {
		this.sysName = sysName;
		this.tlist = new ArrayList<Ticketing>();
	}
	public void setTlist(Ticketing tk) {
		this.tlist.add(tk);
		System.out.println(tk.getFromTo()+" 예매 추가");
	}
	public void showList() {
		System.out.println("시스템명:"+this.sysName);
		if(this.tlist.size()>0) {
			System.out.println("예매 내역 리스트");
			System.out.println("구간\t좌석\t비용");
			for(Ticketing t:tlist) {
				t.ticketInfo();
			}
		}else {
			System.out.println("예매 내역이 없습니다.!!");
		}
	}
}
class Ticketing{
	private String fromTo;
	private String seat;
	private int pay;
	public Ticketing(String fromTo, String seat, int pay) {
		this.fromTo = fromTo;
		this.seat = seat;
		this.pay = pay;
	}
	public void ticketInfo() {
		System.out.print(this.fromTo+"\t");
		System.out.print(this.seat+"\t");
		System.out.print(this.pay+"\n");
	}
	public String getFromTo() {
		return fromTo;
	}
	public void setFromTo(String fromTo) {
		this.fromTo = fromTo;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	
	
}	