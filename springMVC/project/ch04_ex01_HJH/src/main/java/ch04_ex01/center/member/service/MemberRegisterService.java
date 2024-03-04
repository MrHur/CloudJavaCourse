package ch04_ex01.center.member.service;

import ch04_ex01.center.member.Member;
import ch04_ex01.center.member.dao.MemberDao;

public class MemberRegisterService {

    private MemberDao memberDao;

    public MemberRegisterService(MemberDao memberDao) {
        this.memberDao = memberDao;
    }

    public void register(Member member) {
        if (verify(member.getmId())) {
            memberDao.insert(member);
        } else {
            System.out.println("The member has already registered.");
        }
    }

    public boolean verify(String mId) {
        Member member = memberDao.select(mId);
        return member == null ? true : false;
    }

}
