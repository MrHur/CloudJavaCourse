package quiz02;

class Audio extends Product {
	public Audio() {
		super(40); // 슈퍼생성자 오디오 가격은 40으로 설정
	}
	public String toString() {
		//toString이 없으면 반환할때 주소를 반환한다. return 문자열로 문자를 반환
		return "Audio";
	}
}
