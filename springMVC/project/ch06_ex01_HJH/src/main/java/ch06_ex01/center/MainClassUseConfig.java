package ch06_ex01.center;


import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import ch06_ex01.center.configuration.CenterConfig;
import ch06_ex01.center.member.Member;
import ch06_ex01.center.member.service.CenterInformationService;
import ch06_ex01.center.member.service.MemberDeleteService;
import ch06_ex01.center.member.service.MemberModifyService;
import ch06_ex01.center.member.service.MemberRegisterService;
import ch06_ex01.center.member.service.MemberSelectService;
import ch06_ex01.center.member.service.PrintMemberInformationService;
import ch06_ex01.center.utils.InitSampleData;

public class MainClassUseConfig {

    public static void main(String[] args) {

    	AnnotationConfigApplicationContext ctx = 
                new AnnotationConfigApplicationContext(CenterConfig.class);
        
        InitSampleData initSampleData = ctx.getBean("initSampleData", InitSampleData.class);
        String[] mIds = initSampleData.getmIds();
        String[] mPws = initSampleData.getmPws();
        String[] mNames = initSampleData.getmNames();
        String[] mPhones = initSampleData.getmPhones();
        String[] mMails = initSampleData.getmMails();

        MemberRegisterService registerService = ctx.getBean("memberRegisterService", MemberRegisterService.class);
        for (int i = 0; i < mIds.length; i++) {
            registerService.register(new Member(mIds[i], mPws[i], mNames[i], mPhones[i], mMails[i], Member.nowDate(), Member.nowDate()));
            
        }
        

        System.out.println("샘플데이터 조회");
        PrintMemberInformationService printMemberInformatinService =  ctx.getBean("printMemberInformationService", PrintMemberInformationService.class);
        printMemberInformatinService.printMembersInfo();   // 멤버 리스트

        registerService = ctx.getBean("memberRegisterService", MemberRegisterService.class);
        registerService.register(new Member("abc006", "p0006", "melissa", "01012340006", "qwert@naver.com", Member.nowDate(), Member.nowDate()));
        
        System.out.println("신규 회원 등록 후");
        printMemberInformatinService.printMembersInfo();   // 멤버 리스트
        
        System.out.println("중복 회원 등록 후");
        registerService.register(new Member("abc006", "p0006", "melissa", "01012340006", "qwert@naver.com", Member.nowDate(), Member.nowDate()));

        MemberSelectService selectService = ctx.getBean("memberSelectService", MemberSelectService.class);
        Member selectedMember = selectService.select("abc006");
        
        System.out.println("회원 한명만 조회");
        System.out.println("MEMBER START ------------------");
        System.out.print("mId:" + selectedMember.getmId() + "\t");
        System.out.print("|mPw:" + selectedMember.getmPw() + "\t");
        System.out.print("|mName:" + selectedMember.getmName() + "\t");
        System.out.print("|mPhone:" + selectedMember.getmPhone() + "\t");
        System.out.print("|mMails:" + selectedMember.getmMail() + "\t");
        System.out.print("|newDate:" + selectedMember.getNewDate()+ "\t");
        System.out.println("|changeDate:" + selectedMember.getChangeDate());
        System.out.println("END ----------------------------");
        
        MemberModifyService modifyService = ctx.getBean("memberModifyService", MemberModifyService.class);
        modifyService.modify(new Member("abc006", "p0006", "melissa", "01012345678", "okstreet@naver.com", Member.nowDate(), Member.nowDate()));
        
        System.out.println("회원 정보 수정 후 조회");
        printMemberInformatinService.printMembersInfo();   // 멤버 리스트
        
        MemberDeleteService deleteService = ctx.getBean("memberDeleteService", MemberDeleteService.class);
        deleteService.delete("abc005");
        
        System.out.println("회원 삭제 후 조회");
        printMemberInformatinService.printMembersInfo();   // 멤버 리스트
        
        System.out.println("센터 정보 조회");
        CenterInformationService centerInformationService = ctx.getBean("centerInformationService", CenterInformationService.class);
        centerInformationService.printEMSInformation();
        
        ctx.close();

    }

}
