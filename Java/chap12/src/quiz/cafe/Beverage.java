package cafe;

public abstract class Beverage {
	private String name;
	private int price;
	private static int totalSales; // 총 판매 금액
	private static int coffeeSales; // Coffee 판매 개수
	private static int teaSales; // Tea 판매 개수

	public Beverage(String name, int price) {
		this.name = name;
		this.price = price;
	}

	public abstract void calcPrice();

	public void setPrice(int price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public int getPrice() {
		return price;
	}

	public void print() {
		System.out.println(name);
	}

	public static void getSalesInfo(int order, String name, int price) {
		System.out.println(name);
	}

	public static void getTotalPrice() {
		System.out.println("총 판매 금액==>" + totalSales);
		System.out.println("Coffee 판매 개수=>" + coffeeSales +"잔");
		System.out.println("Tea 판매 개수=>" + teaSales +"잔");
	}

	public void sell() {
		totalSales += price;
		if (this instanceof Coffee) {
			coffeeSales++;
		} else if (this instanceof Tea) {
			teaSales++;
		}
	}
}