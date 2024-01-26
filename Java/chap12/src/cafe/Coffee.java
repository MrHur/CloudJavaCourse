package cafe;

public class Coffee extends Beverage {
    public Coffee(String name) {
        super(name, 0); // 초기 가격을 0으로 설정
        calcPrice(); // calcPrice 호출하여 가격 설정
    }

    @Override
    public void calcPrice() {
        // Coffee의 이름에 따라 가격을 설정
        switch (getName()) {
            case "Americano":
                setPrice(1500);
                break;
            case "CafeLatte":
                setPrice(2500);
                break;
            case "Cappuccino":
                setPrice(3000);
                break;
            default:
                // 다른 Coffee 이름이 들어오면 가격을 0으로 설정
                setPrice(0);
                break;
        }
    }
}