package quiz;

public class MultidimensionalArray {

	public static void main(String[] args) {
//		파스칼 삼각형을 출력하는 프로그램 작성.
//		파스칼 삼각형은 첫 번째 줄 첫 번째 행은 1로 초기화한 후
//		다음 줄부터 바로 위 값과 바로 위 왼쪽의 값을 더한 값이 적용됨. (6행 6열 배열로 풀이)
		int[][] arr = new int[6][6];
		int i, j;

		arr[1][1] = 1;
		System.out.println(arr[1][1]);

		for (i = 2; i < arr.length; i++) {
			for (j = 1; j <=i; j++) {
				arr[i][j] = arr[i - 1][j - 1] + arr[i - 1][j];
				System.out.print(arr[i][j]);
			}
			System.out.println();
		}
	}
}