package sec02.exam.Car;

public class Tire {
	// 필드
	public int maxRotation; // 최대 회전수
	public int accumulatedRotation; // 누적 회전수
	public String location; //타이어 위치
	
	// 생성자
	public Tire(String location, int maxRotation) {
		this.location = location;
		this.maxRotation = maxRotation;
	}
	
	// 메서드
	public boolean roll() {  // 타이어를 1회 회전시키는 메서드
		++accumulatedRotation;  // 누적 회전수 1 증가
		if(accumulatedRotation < maxRotation) {
			// 정상 회전(누적<최대)일 경우 실행
			System.out.println(location + " Tire 수명: " + (maxRotation-accumulatedRotation) + "회");
			return true;
		} else {    // 펑크(누적=최대)일 경우 실행
			System.out.println("*** " + location + " Tire 펑크 ***");
			return false;
		}
	}
}
