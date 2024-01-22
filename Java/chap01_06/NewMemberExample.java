package quiz;

public class NewMemberExample {
	String name;
	int age;
	String id;
	String PW;
	
	NewMemberExample(String name, int age, String id){
		this.name = name;
		this.id = id;
		this.age = age;
		this.PW = "****";
	}

	public static void main(String[] args) {
//		Member객체를 생성하고자 합니다.
//		생성자에서 name 필드와 id 필드를 외부에서 받은 값으로
//		초기화 할 수 있도록 NewMember 클래스를 작성해보세요.
		
        NewMemberExample user1 = new NewMemberExample("홍길동", 25, "hong");
        System.out.println("이름: "+user1.name);
        System.out.println("나이: "+user1.id);
        System.out.println("ID: "+user1.age);
        System.out.println("PW: "+user1.PW);
    }
}
