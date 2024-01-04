package quiz;

import java.util.Scanner;

public class Quiz2 {

	public static void main(String[] args) {
		/*
		 * Scanner를 이용해서 이름, 주민번호 앞 6자리, 
		 * 전화번호를 키보드에서 입력받고 아래와 같이 출력하시오. 
		 * (Scanner의 nextLine() 사용)
		 */
		
		// 스캐너 객체 생성
		Scanner sc = new Scanner(System.in);
		
		System.out.println("[필수 정보 입력]");
		
		System.out.print("1. 이름 : ");
		String name = sc.nextLine();
		
		System.out.print("2. 주민번호 앞 6자리 : ");
		String registration = sc.nextLine();
		
		System.out.print("3. 전화번호 : ");
		String telephone = sc.nextLine();
		
		//String으로 받은 주민번호를 Integer type으로 casting.
		int regis = Integer.parseInt(registration);
		
		//sc 로 입력 받은 값을 출력.		
		System.out.println("[입력된 내용]");
		System.out.println("1. 이름: " + name );
		System.out.println("2. 주민번호 앞 6자리: " + regis );
		System.out.println("3. 전화번호: " + telephone );
		
		// scanner 닫기
		sc.close();
	}
}
