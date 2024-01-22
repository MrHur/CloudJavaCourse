package quiz04.CoffeShop;

public class James {
	//필드
	int total;

	//생성자
	public void James() {
        this.total = 0;
    }
	
	//메서드
    void buy(Product product) {
        this.total += product.price;
    }
}
