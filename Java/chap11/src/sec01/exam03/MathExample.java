package sec01.exam03;

public class MathExample {
	public static void main(String[] args) {
		//abs 절대값
		int v1 = Math.abs(-5);
		double v2 = Math.abs(-3.14);
		System.out.println("v1=" + v1);
		System.out.println("v2=" + v2);
		// ceil 올림값
		double v3 = Math.ceil(5.3);
		double v4 = Math.ceil(-5.3);
		System.out.println("v3=" + v3);
		System.out.println("v4=" + v4);
		// floor 버림값
		double v5 = Math.floor(5.3);
		double v6 = Math.floor(-5.3);
		System.out.println("v5=" + v5);
		System.out.println("v6=" + v6);
		// max 최대값
		int v7 = Math.max(5, 9);
		double v8 = Math.max(5.3, 2.5);
		System.out.println("v7=" + v7);
		System.out.println("v8=" + v8);
		// min 최소값
		int v9 = Math.min(5, 9);
		double v10 = Math.min(5.3, 2.5);
		System.out.println("v9=" + v9);
		System.out.println("v10=" + v10);
		// random 랜덤값
		double v11 = Math.random();
		System.out.println("v11=" + v11);
		//Math.rint()와 Math.round()는 둘 다 반올림을 수행하는 메서드로 보일 수 있지만, 그 동작에는 차이가 있습니다.
//		1. `Math.rint(double a)` :
//	    - *`rint` 메서드는 매개변수 `a`를 가장 가까운 정수로 반올림합니다.
//	    - 반환 값은 `double` 타입이며, 소수점 이하에서 짝수로 반올림합니다. 즉, 0.5에서 멀어질수록 가까운 짝수로 반올림합니다.
//	    - 예를 들어, `Math.rint(2.5)`의 결과는 `2.0`이며, `Math.rint(3.5)`의 결과는 `4.0`입니다.
//		2. `Math.round(float a)` / `Math.round(double a)` :
//	    - `round` 메서드는 매개변수 `a`를 반올림하여 가장 가까운 정수로 변환합니다.
//	    - 반환 값은 `long` 또는 `int` 타입이며, 매개변수 `a`와 가장 가까운 정수로 반올림됩니다.
//	    - 예를 들어, `Math.round(2.5)`의 결과는 `3`이며, `Math.round(3.5)`의 결과는 `4`입니다.
		// rint 
		double v12 = Math.rint(5.3);
		double v13 = Math.rint(5.7);
		System.out.println("v12=" + v12);
		System.out.println("v13=" + v13);
		// round 
		long v14 = Math.round(5.3);
		long v15 = Math.round(5.7);
		System.out.println("v14=" + v14);
		System.out.println("v15=" + v15);
		// 소수 둘째자리까지 표시하기 위함. 공식처럼 외워두면 유용함.
		double value = 12.3456;
		double temp1 = value * 100;
		long temp2 = Math.round(temp1);
		double v16 = temp2 / 100.0;
		System.out.println("v16=" + v16);
	}
}
