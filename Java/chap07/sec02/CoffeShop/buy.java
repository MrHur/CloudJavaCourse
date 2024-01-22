package quiz04.CoffeShop;

public class buy {

	public static void main(String[] args) {
		// 가격 설정
		int rb = 1500;
		int cd = 1000;
		int mb = 2000;
		int a = 1000;
		int c = 2000;
		int ca = 3000;

		// 제품 객체 생성
		Paribaguette p = new Paribaguette(cd, rb, mb);
		CoffeeShop cs = new CoffeeShop(a, c, ca);

		// 제임스 객체 생성
		James james = new James();

		// 제임스가 빵과 커피를 구매
		james.buy(p);
		james.buy(cs);

		// 결과 출력
		System.out.println("단팥빵의 가격:" + rb);
		System.out.println("크림도넛의 가격:" + cd);
		System.out.println("모카빵의 가격:" + mb);
		System.out.println("카푸치노의 가격:" + ca);
		System.out.println("아메리카노의 가격:" + a);
		System.out.println("카페라떼의 가격:" + c);
		System.out.println("제임스가 먹은 빵의 총 가격은? " + p.price);
		System.out.println("제임스가 마신 커피의 총 가격은? " + cs.price);
	}
}