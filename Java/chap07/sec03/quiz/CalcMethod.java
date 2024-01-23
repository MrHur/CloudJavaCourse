package quiz;

public class CalcMethod extends Calculator {

	@Override
	public int add(int a, int b) {
		return a + b;
	}

	@Override
	public int subtract(int a, int b) {
		return (a - b);
	}

	double sum = 0.0;

	@Override
	public double average(int[] array) {
		for (int i = 0; i < array.length; i++) {
			sum += array[i];
		}
		double avg = sum / array.length;
		return avg;
	}
}
