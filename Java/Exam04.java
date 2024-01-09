package quiz;

public class Exam04 {

	public static void main(String[] args) {
		// 양수 5개를 입력 받아 배열에 저장하고, 제일 큰 수를 출력하세요.
		int[] num = { 1, 5, 3, 8, 2 };
		int max = num[0];

		for (int i = 0; i < num.length; i++) {
			if (num[i] > max) {
				max = num[i];
			}
		}
		System.out.println("Max : " + max);
	}
}
