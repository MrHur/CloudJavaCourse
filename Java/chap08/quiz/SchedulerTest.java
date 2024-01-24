package quiz;

import java.util.Scanner;

public class SchedulerTest {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("전화 상담 배분방식을 선택하세요");
		System.out.println("R : 한명씩 차례대로 할당");
		System.out.println("L : 쉬고 있거나 대기가 가장 적은 상담원에게 할당");
		System.out.println("p : 우선순위가 높은 고객 먼저 할당");
		String a = sc.next();

        Scheduler scheduler = null;

        if ("R".equalsIgnoreCase(a)) {
            scheduler = new RoundRobin();
        } else if ("L".equalsIgnoreCase(a)) {
            scheduler = new LeastJob();
        } else if ("P".equalsIgnoreCase(a)) {
            scheduler = new PriorityAllLocation();
        } else {
            System.out.println("올바른 입력이 아닙니다.");
            return;
        }

        // 선택된 스케줄러의 메서드 호출
        scheduler.getNextCall();
        scheduler.sendCallToAgent();
        sc.close();
    }
}