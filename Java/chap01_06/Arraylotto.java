package quiz;

public class Arraylotto {

	public static void main(String[] args) {
//		1~45중에 6개 번호를 추출하는 로또번호 발생기 프로그램을 작성하시오.
//		배열의 크기를 45로 선언하고 값은 1~45까지 저장
//		해당 배열을 이용해서 배열 인덱스 0~5번까지의 값을 랜덤함수를 이용해서
//		배열 값을 교환한 후 로또번호는 배열 0~5번째 인덱스 값으로 추출하여 나타내시오.

		// 조건1. 크기가 45인 배열 선언.
		int[] array = new int[45];
		int i;
		// 인덱스 0부터 44까지 랜덤으로 저장.
		for (i = 0; i < array.length; i++) {
			array[i] = ((int) (Math.random() * 45) + 1);
			for(int j=0; j<i; j++)
				if(array[j]==array[i]) {
					i--;
					break;
				}
		}
		// 인덱스 0~5번까지의 로또 번호를 출력.
		for (i = 0; i < (array.length - 39); i++) {
			System.out.println("ball[" + i + "] : " + array[i]);
		}

	}
}
