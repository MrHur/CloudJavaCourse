package quiz;

public class NewMember {
	String name;
	String id;
	
	NewMember(String name, String id){
		this.name = name;
		this.id = id;
		
	}
	
	public static void main(String[] args) {
//		Member객체를 생성하고자 합니다.
//		생성자에서 name 필드와 id 필드를 외부에서 받은 값으로
//		초기화 할 수 있도록 NewMember 클래스를 작성해보세요.
		
		NewMember user1 = new NewMember("홍길동","hong");
				
	}
}
