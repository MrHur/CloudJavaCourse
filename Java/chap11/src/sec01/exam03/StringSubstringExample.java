package sec01.exam03;

public class StringSubstringExample {
	public static void main(String[] args) {	
		String ssn = "880815-1234567 ";
		// 주어진 시작과 끝 인덱스 사이의 문자열 추출
		String firstNum = ssn.substring(0, 6);
		System.out.println(firstNum);		
		// 주어진 인덱스부터 끝까지 문자열 추출
		String secondNum = ssn.substring(7);
		System.out.println(secondNum);
	} 
}