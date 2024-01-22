package quiz;

import java.util.Scanner;

public class GugudanIn_1 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("원하는 단의 숫자를 입력해주세요.");
		int a = sc.nextInt();
		Gugudan_1 gugu = new Gugudan_1();
		gugu.gugudan(a);
	}

}
