package com.company.center.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	// 의존 객체 자동 주입
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/home")
	public String returnHome() {
		return "home";
	}
	
	@RequestMapping("/signUp") //요청 url 매핑
	public String signUp() {
		return "sign_up";
	}
	@RequestMapping("/signIn") //요청 url 매핑
	public String signIn() {
		return "sign_in";
	}
	  
	  @RequestMapping("/signUpConfirm")
	  public String signUpConfirm(MemberVo memberVo) {
		System.out.println("[MemberController] signUpConfirm()"); 
		  
		System.out.println("m_id: " + memberVo.getM_id());
		System.out.println("m_pw: " + memberVo.getM_pw());
		System.out.println("m_name: " + memberVo.getM_name());
		System.out.println("m_phone: " + memberVo.getM_phone());
		System.out.println("m_mail: " + memberVo.getM_mail());
		System.out.println("newDate: " + memberVo.getNewDate());
		System.out.println("mSubject: " + memberVo.getM_subject()); 
		  
		  memberService.signUpConfirm(memberVo);	
		  return "sign_up_ok";
	  }
  
	  @RequestMapping("/signInConfirm")  // 매핑(mapping)
	  public String signInConfirm(MemberVo memberVo) {
	  	  System.out.println("[MemberController] signInConfirm()");
		
		  MemberVo signInedMember = memberService.signInConfirm(memberVo); // 서비스 호출
		
		  if (signInedMember != null)	 // 로그인 성공!
			  return "sign_in_ok";
		  else							 // 로그인 실패!
			  return "sign_in_ng";
		
	  }
}
