package sec02.exam;

public class ForFloatCounterExample {

	public static void main(String[] args) {
//		1.0 은 출력이 안되는데, f 는 부동소숫점 개념으로 0.7 0.8 이 딱 떨어지지 않고 0.700005 0.8000001 이런식으로 값을 정의하기 때문.
		for(float x=0.1f; x<=1.0f; x+=0.1f) {
			System.out.println(x);
		}
	}
}
