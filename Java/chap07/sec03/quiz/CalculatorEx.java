package quiz;

public class CalculatorEx {

	public static void main(String[] args) {

		CalcMethod cc = new CalcMethod();
		int resultAdd = cc.add(2, 3);
		int resultSubtract = cc.subtract(2, 3);
		int[] num = { 1, 2, 3, 4, 5 };
		double resultAverage = cc.average(num);

		System.out.println("add: " + resultAdd);
		System.out.println("subtract: " + resultSubtract);
		System.out.println("average: " + resultAverage);
	}
}
