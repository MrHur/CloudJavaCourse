package quiz;

public class Gugudan_1 {

	void gugudan(int a) {
		int result = 0;
		for (int i = 1; i <= 9; i++) {
			result = a * i;
			System.out.println(a + " * " + i + " = " + result);
		}
	}
}
