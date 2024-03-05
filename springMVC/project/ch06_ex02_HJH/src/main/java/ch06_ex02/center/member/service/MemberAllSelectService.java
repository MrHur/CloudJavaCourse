package ch06_ex02.center.member.service;

import java.util.Map;

import ch06_ex02.center.member.Member;
import ch06_ex02.center.member.dao.MemberDao;

public class MemberAllSelectService {
    private MemberDao memberDao;

    public MemberAllSelectService(MemberDao memberDao) { 
    	this.memberDao = memberDao; 
	 }

    public Map<String, Member> allSelect() {
        return memberDao.getMemberDB();
    }
}