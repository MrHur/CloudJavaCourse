package com.company.center.member.service;

import com.company.center.member.Member;
import com.company.center.member.dao.MemberDao;

public class MemberModifyService {
    private MemberDao memberDao;
    public MemberModifyService(MemberDao memberDao) { 
		this.memberDao = memberDao;
    }

    public void modify(Member member) {
        if (verify(member.getmId())) {
            memberDao.update(member);
        } else {
            System.out.println("Member information is available.");
        }
    }

    public boolean verify(String mId) {
        Member member = memberDao.select(mId);
        return member != null ? true : false;
    }
}