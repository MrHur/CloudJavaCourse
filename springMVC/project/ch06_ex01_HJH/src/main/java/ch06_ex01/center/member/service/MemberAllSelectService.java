package ch06_ex01.center.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import ch06_ex01.center.member.Member;
import ch06_ex01.center.member.dao.MemberDao;

public class MemberAllSelectService {

	@Autowired
    private MemberDao memberDao;


 public MemberAllSelectService(MemberDao memberDao) { this.memberDao =
	  memberDao; }


    public Map<String, Member> allSelect() {
        return memberDao.getMemberDB();
    }

}
