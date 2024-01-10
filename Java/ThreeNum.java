package quiz;

public class ThreeNum {

	public static void main(String[] args) {
//		1과 9 사이의 숫자로 이뤄진 3자리 숫자를 만들어내는 프로그램을 완성하세요.
//		단 숫자의 중복이 있어서는 안됩니다.
		int[] ballArr = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
		int[] number = new int[3];

		for (int i = 0; i < ballArr.length; i++) { // 배열 복사
			int j = (int) (Math.random() * ballArr.length);
			int tmp = 0;
			tmp = ballArr[i];
			ballArr[i] = ballArr[j];
			ballArr[j] = tmp;
		}
		System.arraycopy(ballArr,0, number,0, number.length);
		for(int i=0; i<3; i++)
		System.out.print(ballArr[i]);
	}
}