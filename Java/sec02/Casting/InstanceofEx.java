package sec02.exam.Casting;

public class InstanceofEx {
	
	public static void method4(Parent parent) {
		if(parent instanceof Child ) {
			Child child = (Child) parent;
			System.out.println("method4 - Child�� ��ȯ ����");
		} else {
			System.out.println("method4 - Child�� ��ȯ���� ����");
		}
	}
	
	public static void method5(Parent parent) {
		Child child = (Child) parent;
		System.out.println("method5 - Child�� ��ȯ ����");
	}
	
	public static void main(String[] args) {
		Parent parentA = new Child();
		method4(parentA);
		method5(parentA);
		
		Parent parentB = new Parent();
		method4(parentB);
		method5(parentB); // ���� �߻�
	}

}
