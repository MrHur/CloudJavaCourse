package com.company.center.member;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Member {

    private String mId;
    private String mPw;
    private String mName;
    private String mPhone;
    private String mMail;
    private String newDate;
    private String mSubject;
    
	public Member(String mId, String mPw, String mName, String mPhone, String mMail, String newDate, String mSubject) {
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mPhone = mPhone;
		this.mMail = mMail;
		this.newDate = nowDate();
		this.mSubject = mSubject;
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
	public String getmSubject() {
		return mSubject;
	}	
	public void setmSubject(String mSubject) {
		this.mSubject = mSubject;
	}

	public static String nowDate() {		
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String formatedNow = now.format(formatter);         
				
		return formatedNow;
	}   
}