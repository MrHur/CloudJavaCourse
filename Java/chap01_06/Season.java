package quiz;

import java.util.Scanner;

public class Season {

	public static void main(String[] args) {
		// 월(int)을 입력받아 해당 월의 계절을 호출하는 프로그램을 작성하시오.
		
		Scanner sc = new Scanner(System.in);
		System.out.print("월을 입력해 주세요 : ");
		int season = sc.nextInt();
		
		switch(season) {
			case 3,4,5:
				System.out.println(season+"월은 봄 입니다.");
			break;
			case 6,7,8:
				System.out.println(season+"월은 여름 입니다.");
			break;
			case 9,10,11:
				System.out.println(season+"월은 가을 입니다.");
			break;
			case 12,1,2:
				System.out.println(season+"월은 겨울 입니다.");
			break;
		}
		sc.close();
	}
}
