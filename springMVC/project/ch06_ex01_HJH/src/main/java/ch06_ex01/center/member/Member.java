package ch06_ex01.center.member;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Member {

    private String mId;
    private String mPw;
    private String mName;
    private String mPhone;
    private String mMail;
    private String newDate;
    private String changeDate;
    
	public Member(String mId, String mPw, String mName, String mPhone, String mMail, String newDate,
			String changeDate) {
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mPhone = mPhone;
		this.mMail = mMail;
		this.newDate = nowDate();
		this.changeDate = nowDate();
	}

	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public String getmMail() {
		return mMail;
	}
	public void setmMail(String mMail) {
		this.mMail = mMail;
	}
	public String getNewDate() {
		return newDate;
	}
	public void setNewDate(String newDate) {
		this.newDate = newDate;
	}
	public String getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(String changeDate) {
		this.changeDate = changeDate;
	}

	public static String nowDate() {
		
		// 현재 날짜 구하기
		LocalDate now = LocalDate.now();
		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		// 포맷 적용
		String formatedNow = now.format(formatter);         
				
		return formatedNow;
	}
    
}
