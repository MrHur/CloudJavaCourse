package cafe;

import java.util.Scanner;

public class CoffeeShop {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("****java nara CoffeeShop 영업개시****");
        System.out.print("몇 잔을 주문하시겠습니까? ");
        int selectNum = Integer.parseInt(sc.next());

        // 음료 주문
		System.out.println("총 " + selectNum + "잔의 주문 음료를 선택하세요.");
            System.out.println("1. Americano");
            System.out.println("2. CafeLatte");
            System.out.println("3. Cappuccino");
            System.out.println("4. lemonTea");
            System.out.println("5. ginsengTea");
            System.out.println("6. redginsengTea");
            for (int i = 0; i < selectNum; i++) {
            System.out.println("주문>>");


            int choice = Integer.parseInt(sc.next());
            sellBeverage(choice, i+1);
        }

        // 총 판매 정보 출력
        Beverage.getTotalPrice();
    }

    public static void sellBeverage(int choice, int order) {
        Beverage beverage = null;
//        System.out.println(choice);
        switch (choice) {
        case 1:
            beverage = new Coffee("Americano");
            break;
        case 2:
            beverage = new Coffee("CafeLatte");
            break;
        case 3:
            beverage = new Coffee("Cappuccino");
            break;
        case 4:
            beverage = new Tea("LemonTea");
            break;
        case 5:
            beverage = new Tea("GinsengTea");
            break;
        case 6:
            beverage = new Tea("RedGinsengTea");
            break;
            default:
                System.out.println("잘못된 선택입니다.");
                return;
        }
        // 음료의 가격을 설정하고 출력
        beverage.calcPrice();
        beverage.getSalesInfo(order, beverage.getName(), beverage.getPrice());

        // 음료 판매
        beverage.sell();
    }
}