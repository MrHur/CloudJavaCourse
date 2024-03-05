package ch06_ex01.center.member.service;

import org.springframework.beans.factory.annotation.Autowired;

import ch06_ex01.center.member.Member;
import ch06_ex01.center.member.dao.MemberDao;

public class MemberModifyService {

	@Autowired
    private MemberDao memberDao;
 public MemberModifyService(MemberDao memberDao) { this.memberDao = memberDao;
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
