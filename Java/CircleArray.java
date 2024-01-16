package quiz;

public class CircleArray {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// Circle 객체 생성 및 초기화
		Circle[] c = new Circle[5];

		for (int i = 0; i < c.length; i++) {
			c[i] = new Circle(i);
		}
		// circleArea 메서드 호출
		for (int i = 0; i < c.length; i++) {
			c[i].circleArea();
		}
	}
}