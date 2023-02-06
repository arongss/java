package oliveyoung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oliveyoung.dao.OvMemberDao;
import oliveyoung.vo.OvMember;

@Service
public class OvMemberService {
	@Autowired(required=false)
	public OvMemberDao dao;
	
	public List<OvMember> memberList(OvMember sch){
		if(sch.getName()==null) sch.setName("");
		if(sch.getId()==null) sch.setId("");
		if(sch.getAuth()==null) sch.setAuth("");
		return dao.memberList(sch);
	}
	public List<String> getAuthComb(){
		return dao.getAuthComb();
	}
	public void memberJoin(OvMember ins) {
		dao.memberJoin(ins);
	}
}
