package com.company.center.member.service;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.company.center.member.Member;

public class PrintMemberInformationService {
    MemberAllSelectService allSelectService;
	
 public PrintMemberInformationService(MemberAllSelectService allSelectService) {
	 this.allSelectService = allSelectService; 
}
   
    public void printMembersInfo() {
        Map<String, Member> allMember = allSelectService.allSelect();
        Set<String> keys = allMember.keySet();   
        Iterator<String> iterator = keys.iterator();
        System.out.println("MEMBER LIST START -------------");
        while (iterator.hasNext()) {
            String key = iterator.next();
            Member member = allMember.get(key);
            
            System.out.print("아이디:" + member.getmId() + "\t");
            System.out.print("|비밀번호:" + member.getmPw() + "\t");
            System.out.print("|존성대명:" + member.getmName() + "\t");
            System.out.print("|전화번호:" + member.getmPhone() + "\t");
            System.out.print("|메일:" + member.getmMail() + "\t");
            System.out.print("|가입일자:" + member.getNewDate()+ "\t");
            System.out.println("|신청과목:" + member.getmSubject());

        }
        System.out.println("END ----------------------------");
    }   
}
