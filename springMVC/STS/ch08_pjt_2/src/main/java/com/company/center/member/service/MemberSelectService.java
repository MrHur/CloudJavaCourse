package com.company.center.member.service;

import com.company.center.member.Member;
import com.company.center.member.dao.MemberDao;

public class MemberSelectService {
    private MemberDao memberDao;
 
	public MemberSelectService(MemberDao memberDao) { 
		this.memberDao = memberDao;
	}

    public Member select(String mId) {
        if (verify(mId)) {
            return memberDao.select(mId);
            
        } else {
            System.out.println("Member information is available.");
        }
        return null;
    }

    public boolean verify(String mId) {
        Member member = memberDao.select(mId);
        return member != null ? true : false;
    }
}