package quiz;

public class ArraySum {

	public static void main(String[] args) {
//		다음 2차원 배열에 담긴 모든 값들의 총합과 평균을 구하는 프로그램을 완성하세요.
		int[][] arr = { { 5, 5, 5, 5, 5 }, { 10, 10, 10, 10, 10 }, { 20, 20, 20, 20, 20 }, { 30, 30, 30, 30, 30 } };
		int sum = 0;
		int avg = 0;

		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				sum += arr[i][j];
			}
			avg = sum / (arr.length * arr[0].length);
		}
		System.out.println("합계 : " + sum);
		System.out.println("평균 : " + avg);
	}
}
