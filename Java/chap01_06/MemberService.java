package quiz;

public class MemberService {

    // 멤버 변수 정의
    String id, password;

    // 로그인 메소드 정의
    boolean login(String id, String password) {
        // 주어진 id와 password가 "hong"과 "12345"와 일치하는지 확인
        if(id.equals("hong") && password.equals("12345")) {
            return true;
        } else {
            return false;
        }
    }

    // 로그아웃 메소드 정의
    void logout(String id){
        // 로그아웃 메시지 출력
        System.out.println(id + " 로그아웃 되었습니다.");
    }
}