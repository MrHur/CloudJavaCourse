package com.company.center.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.company.center.member.dao.MemberDao;
import com.company.center.member.service.MemberAllSelectService;
import com.company.center.member.service.MemberDeleteService;
import com.company.center.member.service.MemberModifyService;
import com.company.center.member.service.MemberRegisterService;
import com.company.center.member.service.MemberSelectService;
import com.company.center.member.service.PrintMemberInformationService;
import com.company.center.utils.InitSampleData;

@Configuration
public class Config {

	@Bean
	public InitSampleData initSampleData() {
		InitSampleData initSampleData = new InitSampleData();
		
		String[] mIds = {"곽뚜뚜", "으랏차", "허이쨔", "요이쇼", "곽두팔"};
		initSampleData.setmIds(mIds);
		
		String[] mPws = {"131313", "242424", "343434", "454545", "565656"};
		initSampleData.setmPws(mPws);
		
		String[] mNames = {"홍길동", "김길동", "박길동", "장길동", "한길동"};
		initSampleData.setmNames(mNames);
		
		String[] mPhones = {"01012340001", "01012340002", "01012340003", "01012340004", "01012340005"};
		initSampleData.setmPhones(mPhones);
		
		String[] mMails = {"baba@naver.com", "moon123@yahoo.com", "thx0123@naver.com", "street@daum.net", "soul@gmail.com"};
		initSampleData.setmMails(mMails);
		
		String[] mSubjects = {"python", "java", "html", "css", "database"};
		initSampleData.setmSubjects(mSubjects);
		
		return initSampleData;
	}
		
	@Bean // 빈객체 생성
	public MemberDao memberDao() {
		return new MemberDao();
	}	
	@Bean
	public MemberRegisterService memberRegisterService() {
	    return new MemberRegisterService(memberDao());
	}
	@Bean 
	public MemberModifyService memberModifyService() {    
	    return new MemberModifyService(memberDao());
	}
	@Bean 
	public MemberSelectService memberSelectService() {    
	    return new MemberSelectService(memberDao());
	}
	@Bean 
	public MemberDeleteService memberDeleteService() {    
	    return new MemberDeleteService(memberDao());
	}
    @Bean 
    public MemberAllSelectService memberAllSelectService() { 
        return new MemberAllSelectService(memberDao());
    }
	@Bean 
	public PrintMemberInformationService printMemberInformationService(MemberDao memberDao) {    
	    return new PrintMemberInformationService(memberAllSelectService());
	}
}
