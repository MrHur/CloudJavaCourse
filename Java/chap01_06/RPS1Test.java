package quiz;

import java.util.Scanner;

public class RPS1Test {

	public static void main(String[] args) {
//		철수와 영희가 가위(s), 바위(r), 보(p) 게임을 한다, 
//		r,p,s 중 하나를 입력해 승자 또는 무승부를 출력하는 코드를 작성하시오.
		Scanner sc = new Scanner(System.in);

//		무한루프
		while (true) {
			
//			철수가 낼 패는?
			System.out.print("철수: ");
			String boy = sc.nextLine();
			
//			영희가 낼 패는?
			System.out.print("영희: ");
			String girl = sc.nextLine();
			
//			가위,바위,보가 입력 됐을 때, 같은 문자를 비교할 때 equals 를 쓰지만 equalsIgnoreCase 를 쓰면 대소문자를 구분하지 않고 받을 수 있음.
			if ((boy.equalsIgnoreCase("r") || boy.equalsIgnoreCase("s") || boy.equalsIgnoreCase("p"))
					&& (girl.equalsIgnoreCase("r") || girl.equalsIgnoreCase("s") || girl.equalsIgnoreCase("p"))) {
				
//				철수의 승리 경우의 수
				if ((boy.equalsIgnoreCase("r") && girl.equalsIgnoreCase("s")) || (boy.equalsIgnoreCase("s") && girl.equalsIgnoreCase("p"))
						|| (boy.equalsIgnoreCase("p") && girl.equalsIgnoreCase("r"))) {
					System.out.println("철수, 승!");
					break;
					
//					철수와 영희가 같은 패를 냈을 경우, 비겼다는 메시지 출력 후, 다시 루프
				} else if ((boy.equalsIgnoreCase("r") && girl.equalsIgnoreCase("r")) || (boy.equalsIgnoreCase("s") && girl.equalsIgnoreCase("s"))
						|| (boy.equalsIgnoreCase("p") && girl.equalsIgnoreCase("p"))) {
					System.out.println("비겼어!");
//					continue; 없어도 다시 루프 반복.
					
//					그 이외에 영희 승리 경우의 수
				} else {
					System.out.println("영희, 승!");
					break;
				}
				
//				가위, 바위, 보 이외의 다른 문자가 입력 됐을 경우, 다시 입력 받음.
			} else {
				System.out.println("다시 입력해주세요");
				continue;
			}
		}
//		스캐너 아웃
		sc.close();
	}
}
