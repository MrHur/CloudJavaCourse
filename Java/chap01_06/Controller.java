package quiz;

public class Controller {
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
