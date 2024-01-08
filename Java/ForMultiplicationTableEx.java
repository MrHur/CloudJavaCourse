package sec02.exam;

public class ForMultiplicationTableEx {

	public static void main(String[] args) {
		for (int m=2; m<=9; m++) {
			System.out.println("*** " + m + "단 ***");

			for(int n=1; n<=9; n++) {
				System.out.println(m + " x " + n + " = " + (m*n));
			}
//			단이 끝나고 개행
			System.out.println();
		}

	}

}
