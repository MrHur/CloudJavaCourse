package quiz;

import java.util.Scanner;

public class Constellation {

    public static void main(String[] args) {
        try (Scanner scan = new Scanner(System.in)) {
            int month, day;

            System.out.print("월을 입력해주세요: ");
            month = scan.nextInt();

            System.out.print("일을 입력해주세요: ");
            day = scan.nextInt();

            String zodiacSign = findZodiacSign(month, day);

            if (zodiacSign != null) {
                System.out.println("당신의 별자리는 " + zodiacSign + "입니다.");
            } else {
                System.out.println("잘못된 입력입니다.");
            }
        } catch (Exception e) {
            System.out.println("올바르지 않은 입력 형식입니다.");
        }
    }

    private static String findZodiacSign(int month, int day) {
        int[] daysInMonth = { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

        if (1 <= month && month <= 12 && 1 <= day && day <= daysInMonth[month]) {
            if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
                return "물병자리";
            } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
                return "물고기자리";
            } else if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
                return "양자리";
            } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
                return "황소자리";
            } else if ((month == 5 && day >= 21) || (month == 6 && day <= 21)) {
                return "쌍둥이자리";
            } else if ((month == 6 && day >= 22) || (month == 7 && day <= 22)) {
                return "게자리";
            } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
                return "사자자리";
            } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
                return "처녀자리";
            } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
                return "천칭자리";
            } else if ((month == 10 && day >= 23) || (month == 11 && day <= 22)) {
                return "전갈자리";
            } else if ((month == 11 && day >= 23) || (month == 12 && day <= 24)) {
                return "궁수자리";
            } else if ((month == 12 && day >= 25) || (month == 1 && day <= 19)) {
                return "염소자리";
            }
        }

        return null;
    }
}