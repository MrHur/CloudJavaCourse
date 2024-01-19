package sec01.exam;

public class Car {
	//필드
	public int speed;
	
	//메서드
	public void speedUp() {
		speed += 1;
	}		
	
	//final 메서드
	public final void stop() {
		System.out.println("���� ����");
		speed = 0;
	}
}

