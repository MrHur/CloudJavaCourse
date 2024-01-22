package quiz02.Casher;

public class Buyer {
	Product[] cart = new Product[3];
	// 카트 바구니 .. 바구니가 다 차면 새롭게 2개의 크기만큼 생성
	int money = 10000; // 초기 설정 돈 10000
	int bonusPoint = 0; // 포인트는 0원
	int i; // 물건 산 것들과 리스트를 작성하기 위해 필요한 인스턴스.
	
	public void buy(Product p) { // buy 메서드의 파라미터값으로 조상 프로덕트인 p 설정
		if (money <= p.price) { // 만약에 현재 소지하고 있는 돈이 물건의 가격보다 같거나 적게되면
			System.out.println("잔액이 부족하여 물건을 구매하실 수 없습니다."); // 아래 문구 출력.
			return;  // 더이상 의미가 없으므로 리턴을 통해 종료.
		}
		money -= p.price; // 소지금에서 물건의 값을 뺀다.
		bonusPoint += p.bonusPoint; // 보너스 포인트를 쌓는다.
		System.out.println(p.toString() + "을 구입하셨습니다."); // p인자의 물품 이름을 표시하도록 설정.
		add(p); // 물건을 담아주는 함수이다. add(p)형으로 해서 아래의 함수를 적용.
	}
}
