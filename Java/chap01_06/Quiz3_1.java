package quiz;

import java.util.Scanner;

public class Quiz3_1 {

	public static void main(String[] args) {
		// 연필의 자루 수와 학생의 인원수를 입력(Scanner 이용) 받아서
		// 학생 1명당 받을 수 있는 연필의 자루수 와 남는 연필의 개수를 출력하시오.
		
		// 스캐너 객체 생성.
		Scanner sc = new Scanner(System.in);
		
		// 연필 갯수를 입력 받음.
		System.out.print("연필자루 수:");
		int pencil = sc.nextInt();
		
		// 학생 수를 입력 받음.
		System.out.print("학생 수:");
		int studentNum = sc.nextInt();
		
        //구분선.
		System.out.println("-----------------");
		
		//연필의 갯수를 학생 수로 나눈 값 -> 학생 1명당 연필 갯수.		
		int stppen = pencil/studentNum;
		
		//연필의 갯수를 학생 수로 나누고 남은 값 -> 남은 연필 갯수.
		int sparePan = pencil%studentNum;
		
		// 출력 결과.
		System.out.println("학생 1명당 연필 갯수:"+stppen);
		System.out.println("남는 연필 갯수:"+sparePan);
		
		//스캐너 닫기
		sc.close();
	}
}
