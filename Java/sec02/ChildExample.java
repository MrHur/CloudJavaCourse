package sec02.exam;

public class ChildExample {
	public static void main(String[] args) {
		  Child child = new Child();

		  Parent parent = child;

		  parent.method1();

		  parent.method2();    // Child 클래스에서 재정의

		  //parent.method3();  Parent 클래스에 method3이 없기 때문에 호출 불가
	}
}
