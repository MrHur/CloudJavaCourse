package quiz;

public class MemberExample {
	public static void main(String[] args) {
		Member member = new Member();
		member.Name = "최하얀";
		member.age = 23;
		member.Id = "white";
		member.Password = "1234";
		
		System.out.println("이름 : " + member.Name);
		System.out.println("나이 : " + member.age);
		System.out.println("ID : " + member.Id);
		System.out.println("PW : " + member.Password);
	}
}