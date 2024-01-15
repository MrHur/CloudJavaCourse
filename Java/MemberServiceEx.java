package quiz;

import java.util.Scanner;

public class MemberServiceEx {

	public static void main(String[] args) {
//		멤버 서비스 객체 생성.
		MemberService memberService = new MemberService();
//		스캐너 호출
//		id와 pw 입력받음.
		Scanner sc = new Scanner(System.in);
		System.out.println("아이디를 입력해주세요.");
		String id = sc.nextLine();
		System.out.println("패스워드를 입력해주세요.");
		String password = sc.nextLine();
//      입력 값을 id와 pw에 받아, 결과값으로 진위 확인.
		boolean result = memberService.login(id, password);
//		id pw 일치 확인.
		if(result) {
			System.out.println("로그인 되었습니다.");
			memberService.logout(id);
		} else {
			System.out.println("id 또는 password가 올바르지 않습니다.");
		}
		   // Scanner 사용이 끝나면 닫아주기
        sc.close();
	}
}
