package sec02.exam;

public class WhilePrintFrom1To30Example {

	public static void main(String[] args) {
		// 조건 1. while 문 조건식에 반드시 true 를 입력할 것.
		// 조건 2. 1~30까지의 합을 구할 것.		
		int sum = 0;
		int i = 1;
		while (true) {
			if (i < 31) {
				sum += i;
				i++;
			} else {
				break;
			}
			System.out.println("1~" + (i - 1) + " 합 : " + sum);
		}
	}
}
