package sec01.exam03;

public class StringTrimExample {
	public static void main(String[] args) {
		//trim 공백 제거
		String tel1 = "  02";
		String tel2 = "123   ";
		String tel3 = "   1234   ";
		
		String tel = tel1.trim() + tel2.trim() + tel3.trim();
		System.out.println(tel);
	}
}

