package quiz;

public class Tv {
 
//	필드
	String brand = "LG";
	int year = 2017;
	int inch = 32;
	
//	생성자
	Tv(){}
//	메서드
	public void show(String a, int b, int c){
		System.out.println(a +"에서 만든 "+b+"년형 "+c+"인치 TV");
	}
	public void show(){
		show(brand, year, inch);  //기본값 사용
	}
}
