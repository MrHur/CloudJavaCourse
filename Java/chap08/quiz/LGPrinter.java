package quiz;

public class LGPrinter implements Printer {
	@Override
	public void print(String doc) {
		System.out.println("LG 프린터");
		System.out.println(doc+"를 인쇄합니다.");
	}
}
