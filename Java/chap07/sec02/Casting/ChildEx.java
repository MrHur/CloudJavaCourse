package sec02.exam.Casting;

public class ChildEx {

	public static void main(String[] args) {
		Parent parent = new Child(); // promotion 진행
		
		parent.field1 = "data1";
		parent.method1();
		parent.method2();
		
//		parent.field2 = "data2";
//		parent.method3();
		
		Child child = (Child) parent;
		child.field2 = "yyy"; // 가능
		child.method3(); // 가능
	}

}
