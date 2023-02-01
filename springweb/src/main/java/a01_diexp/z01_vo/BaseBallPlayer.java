package a01_diexp.z01_vo;

public class BaseBallPlayer {
	private String name;
	private double hitRatio;
	private BaseBallTeam baseBallTeam;
	public BaseBallPlayer() {
		// TODO Auto-generated constructor stub
	}
	public BaseBallPlayer(String name, double hitRatio) {
		this.name = name;
		this.hitRatio = hitRatio;
	}
	public void teamInfo() {
		System.out.println("# 소속팀 정보 #");
		System.out.println("선수명:"+name);
		System.out.println("타율:"+hitRatio);
		if(baseBallTeam!=null) {
			System.out.println("팀명:"+baseBallTeam.getTname());
			System.out.println("전적:"+baseBallTeam.getWin()+"승 "+baseBallTeam.getDraw()+"무 "+baseBallTeam.getLose()+"패");
		}else {
			System.out.println("소속한 팀이 없네요.");
		}
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getHitRatio() {
		return hitRatio;
	}
	public void setHitRatio(double hitRatio) {
		this.hitRatio = hitRatio;
	}
	public BaseBallTeam getBaseBallTeam() {
		return baseBallTeam;
	}
	public void setBaseBallTeam(BaseBallTeam baseBallTeam) {
		this.baseBallTeam = baseBallTeam;
	}
}