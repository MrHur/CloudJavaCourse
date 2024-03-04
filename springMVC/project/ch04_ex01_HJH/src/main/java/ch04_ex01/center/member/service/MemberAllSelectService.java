package ch04_ex01.center.member.service;

import java.util.Map;

import ch04_ex01.center.member.Member;
import ch04_ex01.center.member.dao.MemberDao;

public class MemberAllSelectService {

    private MemberDao memberDao;

    public MemberAllSelectService(MemberDao memberDao) {
        this.memberDao = memberDao;
    }

    public Map<String, Member> allSelect() {
        return memberDao.getMemberDB();
    }

}
