package sec01.exam;

public class SportsCar extends Car {
		@Override
		public void speedUp() {
			speed += 10;
		}
		
		//final 메서드는 오버라이딩이 안됨
		/*
		@Override
		public void stop() {
			System.out.println("스포츠카를 멈춤");
			speed = 0;
		}
		*/
	}