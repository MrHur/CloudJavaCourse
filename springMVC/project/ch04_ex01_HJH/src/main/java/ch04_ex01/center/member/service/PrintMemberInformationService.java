package ch04_ex01.center.member.service;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import ch04_ex01.center.member.Member;

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
            
            System.out.print("mId:" + member.getmId() + "\t");
            System.out.print("|mPw:" + member.getmPw() + "\t");
            System.out.print("|mName:" + member.getmName() + "\t");
            System.out.print("|mPhone:" + member.getmPhone() + "\t");
            System.out.print("|mMails:" + member.getmMail() + "\t");
            System.out.print("|newDate:" + member.getNewDate()+ "\t");
            System.out.println("|changeDate:" + member.getChangeDate());

        }
        System.out.println("END ----------------------------");
    }
    
}
