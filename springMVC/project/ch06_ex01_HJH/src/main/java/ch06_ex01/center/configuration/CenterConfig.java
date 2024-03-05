package ch06_ex01.center.configuration;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import ch06_ex01.center.member.DBConnectionInfo;
import ch06_ex01.center.member.dao.MemberDao;
import ch06_ex01.center.member.service.CenterInformationService;
import ch06_ex01.center.member.service.MemberAllSelectService;
import ch06_ex01.center.member.service.MemberDeleteService;
import ch06_ex01.center.member.service.MemberModifyService;
import ch06_ex01.center.member.service.MemberRegisterService;
import ch06_ex01.center.member.service.MemberSelectService;
import ch06_ex01.center.member.service.PrintMemberInformationService;
import ch06_ex01.center.utils.InitSampleData;


@Configuration
public class CenterConfig {

	@Bean
	public InitSampleData initSampleData() {
		InitSampleData initSampleData =new InitSampleData();
		
		String[] mIds = {"abc001", "abc002", "abc003", "abc004", "abc005"};
		initSampleData.setmIds(mIds);
		
		String[] mPws = {"p0001", "p0002", "p0003", "p0004", "p0005"};
		initSampleData.setmPws(mPws);
		
		String[] mNames = {"agatha", "barbara", "chris", "doris", "elva"};
		initSampleData.setmNames(mNames);
		
		String[] mPhones = {"01012340001", "01012340002", "01012340003", "01012340004", "01012340005"};
		initSampleData.setmPhones(mPhones);
		
		String[] mMails = {"xxx@naver.com", "xxx@naver.com", "xxx@naver.com", "xxx@naver.com", "xxx@naver.com"};
		initSampleData.setmMails(mMails);
		
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
	@Bean //setter이용 주입
	public DBConnectionInfo dev_DBConnectionInfoDev() {
		DBConnectionInfo dbConnectionInfo = new DBConnectionInfo();
		dbConnectionInfo.setUrl("000.000.000.000");
		dbConnectionInfo.setUserId("admin");
		dbConnectionInfo.setUserPw("0000");
		
		return dbConnectionInfo;
	}
	@Bean //setter이용 주입
	public DBConnectionInfo real_DBConnectionInfoDev() {
		DBConnectionInfo dbConnectionInfo = new DBConnectionInfo();
		dbConnectionInfo.setUrl("111.111.111.111");
		dbConnectionInfo.setUserId("master");
		dbConnectionInfo.setUserPw("1111");
		
		return dbConnectionInfo;
	}
		@Bean //setter 주입시 List, Map
		public CenterInformationService centerInformationService() {
			CenterInformationService centerInformationService =
					new CenterInformationService();
			centerInformationService.setInfo("Center Management System program was developed in 2022.");
			centerInformationService.setCopyRight("COPYRIGHT(C) 2022 center CO., LTD. ALL RIGHT RESERVED. CONTACT MASTER FOR MORE INFORMATION.");
			centerInformationService.setVer("The version is 1.0");
			centerInformationService.setsYear(2022);
			centerInformationService.setsMonth(3);
			centerInformationService.setsDay(1);
			centerInformationService.seteYear(2022);
			centerInformationService.seteMonth(4);
			centerInformationService.seteDay(30);
			
			List<String> developers = new ArrayList<String>();
			developers.add("Cheney");
			developers.add("Eloy");
			developers.add("Jasper");
			developers.add("Dillon");
			developers.add("Kian");
			centerInformationService.setDevelopers(developers);
			
			Map<String, String> administrators = new HashMap<String, String>();
			administrators.put("Cheney", "cheney@springPjt.org");
			administrators.put("Jasper", "Jasper@springPjt.org");
			centerInformationService.setAdministrators(administrators);
			
			Map<String, DBConnectionInfo> dbInfos = new HashMap<String, DBConnectionInfo>();
			dbInfos.put("dev", dev_DBConnectionInfoDev());
			dbInfos.put("real", real_DBConnectionInfoDev());
			centerInformationService.setDbInfos(dbInfos);
			
			return centerInformationService;
		}
}
