package ch06_ex02.center;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import ch06_ex02.center.configuration.Config;
import ch06_ex02.center.member.Member;
import ch06_ex02.center.member.service.MemberDeleteService;
import ch06_ex02.center.member.service.MemberModifyService;
import ch06_ex02.center.member.service.MemberRegisterService;
import ch06_ex02.center.member.service.MemberSelectService;
import ch06_ex02.center.member.service.PrintMemberInformationService;
import ch06_ex02.center.utils.InitSampleData;

public class MainClass {

    public static void main(String[] args) {

    	AnnotationConfigApplicationContext ctx = 
                new AnnotationConfigApplicationContext(Config.class);
        
        InitSampleData initSampleData = ctx.getBean("initSampleData", InitSampleData.class);
        String[] mIds = initSampleData.getmIds();
        String[] mPws = initSampleData.getmPws();
        String[] mNames = initSampleData.getmNames();
        String[] mPhones = initSampleData.getmPhones();
        String[] mMails = initSampleData.getmMails();
        String[] mSubjects = initSampleData.getmSubjects();

        MemberRegisterService registerService = ctx.getBean("memberRegisterService", MemberRegisterService.class);
        for (int i = 0; i < mIds.length; i++) {
            registerService.register(new Member(mIds[i], mPws[i], mNames[i], mPhones[i], mMails[i], Member.nowDate(), mSubjects[i]));            
        }

        System.out.println("샘플데이터 조회");
        PrintMemberInformationService printMemberInformatinService =  ctx.getBean("printMemberInformationService", PrintMemberInformationService.class);
        printMemberInformatinService.printMembersInfo();

        registerService = ctx.getBean("memberRegisterService", MemberRegisterService.class);
        registerService.register(new Member("음화홧", "777777", "허준혁", "01012344321", "hello@naver.com", Member.nowDate(), "spring"));
        
        System.out.println("신규 회원 등록 후");
        printMemberInformatinService.printMembersInfo();
        
        System.out.println("중복 회원 등록 후");
        registerService.register(new Member("음화홧", "777777", "허준혁", "01012344321", "hello@naver.com", Member.nowDate(), "spring"));

        MemberSelectService selectService = ctx.getBean("memberSelectService", MemberSelectService.class);
        Member selectedMember = selectService.select("음화홧");
        
        System.out.println("회원 한명만 조회");
        System.out.println("MEMBER START ------------------");
        System.out.print("아이디:" + selectedMember.getmId() + "\t");
        System.out.print("|비밀번호:" + selectedMember.getmPw() + "\t");
        System.out.print("|존성대명:" + selectedMember.getmName() + "\t");
        System.out.print("|전화번호:" + selectedMember.getmPhone() + "\t");
        System.out.print("|메일:" + selectedMember.getmMail() + "\t");
        System.out.print("|가입일자:" + selectedMember.getNewDate()+ "\t");
        System.out.println("|신청과목:" + selectedMember.getmSubject());
        System.out.println("END ----------------------------");
        
        MemberModifyService modifyService = ctx.getBean("memberModifyService", MemberModifyService.class);
        modifyService.modify(new Member("음화홧", "777777", "허준혁", "01012344321", "okstreet@naver.com", Member.nowDate(), "javascript"));
        
        System.out.println("회원 정보 수정 후 조회");
        printMemberInformatinService.printMembersInfo(); 
        
        MemberDeleteService deleteService = ctx.getBean("memberDeleteService", MemberDeleteService.class);
        deleteService.delete("요이쇼");
        
        System.out.println("회원 삭제 후 조회");
        printMemberInformatinService.printMembersInfo(); 
        
        ctx.close();
    }
}
