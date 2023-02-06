package oliveyoung.dao;

import java.util.List;

import oliveyoung.vo.OvMember;

public interface OvMemberDao {
	public List<OvMember> memberList(OvMember sch);
	public List<String> getAuthComb();
	public void memberJoin(OvMember ins);
}
