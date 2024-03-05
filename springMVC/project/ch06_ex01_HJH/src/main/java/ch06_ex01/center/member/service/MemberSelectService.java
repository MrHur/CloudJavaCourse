package ch06_ex01.center.member.service;

import org.springframework.beans.factory.annotation.Autowired;

import ch06_ex01.center.member.Member;
import ch06_ex01.center.member.dao.MemberDao;

public class MemberSelectService {

	@Autowired
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
