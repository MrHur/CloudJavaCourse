package quiz02;

public class Carmain {

	public static void main(String[] args) {
		// 레이서를 부른다.
		Racer man = new Racer();
		Car[] car = new Car[2];
		car[0] = new Maserati();
		car[1] = new Ferrari();
		
		for(int i = 0; i<2; i++) {
			man.drive(car[i]);
		}
		
		// arr 사용하지 않으면 이런식으로도 만들 수 있음.
//		Car car1 = null;
//		car1 = new Maserati();
//		man.drive(car1);
//		man.drive(new Ferrari());
	}

}
