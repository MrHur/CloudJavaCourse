package quiz;

import java.util.Scanner;

public class LoginSys {

    // 회원 가입과 로그인 시스템
    // 로그인 성공 시 이름과 전화번호를 출력하는 코드를 작성해보자.
    // 멤버 정보는 총 100명분의 정보만 저장이 가능하도록 합니다.
    public static Member[] members = new Member[100];
    public static Scanner sc = new Scanner(System.in);
    public static int memberCount = 0; // 등록된 회원 수를 저장하는 변수

    public static class Controller {
        View view = new View();

        public Controller() {
            while (true) {
                int selectNum = view.menu(0);

                switch (selectNum) {
                    case 1:
                        view.signUp();
                        view.deadline();
                        break;
                    case 2:
                        view.LogIn();
                        break;
                    case 3:
                        view.programExit();
                        break;
                    default:
                        System.out.println("올바른 메뉴를 선택해주세요.");
                }
            }
        }
    }

    public static void main(String[] args) {
        // 로그인 프로그램
        new Controller();
    }
}