package sec03.exam;

public class PhoneEx {

	public static void main(String[] args) {
		//Phone phone = new Phone(); (x)
		
		SmartPhone smartPhone = new SmartPhone("홍길동");
		
		smartPhone.turnOn();
		smartPhone.internetSearch();
		smartPhone.turnOff();
	}
}
