package quiz02;

public class PersonEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Professor pro = new Professor();
		pro.setPhone("010-111-1222");
		System.out.println(pro.getPhone());
		Person per = pro; //promotion
		System.out.println(per.getPhone());
	}
}
