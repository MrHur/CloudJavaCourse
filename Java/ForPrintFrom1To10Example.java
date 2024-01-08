package sec02.exam;

public class ForPrintFrom1To10Example {

	public static void main(String[] args) {
//		이렇게 조건식에 변수를 동시에 지정해 줄 수 있음.
		for(int i=1, j=100; i<=10 && j<=105; i++, j++) {
			System.out.println(i);
		}
	}
}
