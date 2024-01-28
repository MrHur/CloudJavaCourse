package cafe;

public class Tea extends Beverage {
    public Tea(String name) {
        super(name, 0); // 초기 가격을 0으로 설정
        calcPrice(); // calcPrice 호출하여 가격 설정
    }

    @Override
    public void calcPrice() {
        // Tea의 이름에 따라 가격을 설정
        switch (getName()) {
        case "LemonTea":
            setPrice(1500);
            break;
        case "GinsengTea":
            setPrice(2000);
            break;
        case "RedGinsengTea":
            setPrice(3000);
            break;
            default:
                // 다른 Tea 이름이 들어오면 가격을 0으로 설정
                setPrice(0);
                break;
        }
    }
}