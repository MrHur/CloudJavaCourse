package quiz;

import java.util.Scanner;

public class MonthSchedule {
    Scanner sc = new Scanner(System.in);
    // 필드
    private String[] works; // 각 날짜의 작업을 저장할 배열
    int day;

    // 생성자: MonthSchedule 객체를 초기화
    public MonthSchedule(int day) {
        this.day = day;
        this.works = new String[30];
    }

    // 사용자에게 메뉴를 출력하는 메서드
    public void menu() {
        System.out.print("할일(입력:1, 보기:2, 끝내기:3)>>");
    }

    // 사용자에게 날짜를 입력받는 메서드
    public int day() {
        System.out.print("날짜(1~30)?");
        this.day = Integer.parseInt(sc.nextLine());
        return day;
    }

    // 사용자에게 할일을 입력받아 배열에 저장하는 메서드
    public void input() {
        day(); // 날짜를 입력받음
        System.out.print("할일(빈칸없이입력)?");
        String work = sc.nextLine();
        works[day - 1] = work; // 배열 인덱스는 0부터 시작하므로 day에 1을 빼줌.
        System.out.println();
    }

    // 저장된 할일을 출력하는 메서드
    public void view() {
        day(); // 날짜를 입력받음
        show();
    }

    // 프로그램을 종료하는 메서드
    public boolean finish() {
        System.out.println("프로그램을 종료합니다.");
        return false;
    }

    // 저장된 할일을 출력하는 메서드
    public void show() {
        if (works[day - 1] == null) {
            System.out.println("없는디요?");
        } else {
            System.out.println(works[day - 1] + "인디요ㅎㅎ");
        }
    }

    // 현재 날짜의 할일을 반환하는 메서드
    public String getWork() {
        return works[day - 1];
    }

    // 현재 날짜의 할일을 설정하는 메서드
    public void setWork(String work) {
        this.works[day - 1] = work;
    }

    // 프로그램 실행 메서드
    public void run() {
        boolean run = true;
        System.out.println("이번달 스케쥴 관리 프로그램.");
        while (run) {
            menu(); // 메뉴를 출력
            int selectNum = Integer.parseInt(sc.nextLine());
            switch (selectNum) {
                case 1:
                    input(); // 할일 입력
                    break;
                case 2:
                    view(); // 할일 보기
                    break;
                case 3:
                    run = finish(); // 프로그램 종료
                    break;
            }
        }
    }
}