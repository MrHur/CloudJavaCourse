package quiz02;

public class Product {
	int price; // 물건의 공통적인 부분 가격
	int bonusPoint; // 보너스 포인트 인스턴스 변수
	
	public Product(int price) {
		// 컨스트럭트(생성자) 를 가격만 받게 하고, 보너스 포인트는 10% 적립이 되도록 설정.
		this.price = price;
		// 프라이스 금액의 10%만 쌓이게 설정.
		this.bonusPoint = (int) (price /10);
	}
}
