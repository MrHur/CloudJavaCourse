package ch06_ex01.center.member.service;

import org.springframework.beans.factory.annotation.Autowired;

import ch06_ex01.center.member.Member;
import ch06_ex01.center.member.dao.MemberDao;

public class MemberRegisterService {

	@Autowired
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
