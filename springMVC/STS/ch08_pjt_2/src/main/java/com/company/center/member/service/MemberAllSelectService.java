package com.company.center.member.service;

import java.util.Map;

import com.company.center.member.Member;
import com.company.center.member.dao.MemberDao;

public class MemberAllSelectService {
    private MemberDao memberDao;

    public MemberAllSelectService(MemberDao memberDao) { 
    	this.memberDao = memberDao; 
	 }

    public Map<String, Member> allSelect() {
        return memberDao.getMemberDB();
    }
}