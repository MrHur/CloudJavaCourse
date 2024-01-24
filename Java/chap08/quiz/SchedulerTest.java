package quiz;

import java.util.Scanner;

public class SchedulerTest {
	// 문제. 고객 센터에 전화가 오면 대기열에 저장된다. 상담원이 지정되기 전까지 대기상태가 된다.
    // 각 전화를 상담원에게 배분하는 정책은 여러 방식으로 구현할 수 있다.
	// 조건1. Interface Scheduler 생성  getNextCall(), sendCallToAgent() 를 생성.
	// 조건2. 구현 클래스를 아래와 같이 생성(단순 출력) RoundRobin / LeastJob / PriorityAllLocation
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("전화 상담 배분방식을 선택하세요");
		System.out.println("R : 한명씩 차례대로 할당");
		System.out.println("L : 쉬고 있거나 대기가 가장 적은 상담원에게 할당");
		System.out.println("p : 우선순위가 높은 고객 먼저 할당");

		// 문자열을 입력 받음.  스케쥴 빈 객체 생성.
		String a = sc.next();
        Scheduler scheduler = null;

        // 각각 R, L, P에 대해 대소문자 구분없이 a 에 입력받은 문자열과 비교하여, 해당하는 객체를 생성.
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

        // 선택된 스케줄러의 메서드 호출.
        scheduler.getNextCall();
        scheduler.sendCallToAgent();
        // 스캐너 아웃.
        sc.close();
    }
}