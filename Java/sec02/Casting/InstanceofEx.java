package sec02.exam.Casting;

public class InstanceofEx {
	
	public static void method4(Parent parent) {
		if(parent instanceof Child ) {
			Child child = (Child) parent;
			System.out.println("method4 - Child로 변환 성공");
		} else {
			System.out.println("method4 - Child로 변환되지 않음");
		}
	}
	
	public static void method5(Parent parent) {
		Child child = (Child) parent;
		System.out.println("method5 - Child로 변환 성공");
	}
	
	public static void main(String[] args) {
		Parent parentA = new Child();
		method4(parentA);
		method5(parentA);
		
		Parent parentB = new Parent();
		method4(parentB);
		method5(parentB); // 예외 발생
	}

}
