package quiz;

public class ArrayChange {

	public static void main(String[] args) {
		// a의 값과 b의 값을 번갈아 c에 저장하는 코드를 작성.
		int a[] = { 10, 20, 30 };
		int b[] = { 40, 50, 60 };
		int c[] = new int[6];
		int i, j = 0;

		// a와 b의 값을 번갈아가면서 c에 저장.
		for (i = 0; i < a.length; i++) {
			c[j++] = a[i];
			c[j++] = b[i];
		}
		// c를 호출.		
		System.out.println("c배열 값: \n" );
		for (i = 0; i < c.length; i++) {
			System.out.print(c[i]+" ");
		}
	}
}
