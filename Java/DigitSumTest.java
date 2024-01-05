package quiz;

import java.util.Scanner;

public class DigitSumTest {

	public static void main(String[] args) {
		// 키보드로 0부터 999사이의 정수를 입력받아 각자릿수를 더한 결과를 출력.
		
		Scanner sc = new Scanner(System.in);
		System.out.print("0~999 사이의 숫자를 입력하세요 : ");
		int num = sc.nextInt();
		
//		입력받은 숫자의 100의 자리
		int	hund = num/100;
		
// 		입력받은 숫자의 1의 자리
		int one = num%10;
		
//		입력받은 숫자의 10의 자리 
		int ten = (num - (hund * 100) - one)/10;
		
		int sum = hund + ten + one;
		System.out.println(sum);
	}

}
