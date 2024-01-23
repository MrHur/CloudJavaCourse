package quiz;

public class SamsungPrinter implements ColorPrintable {
	@Override
	public void print(String doc) {
		System.out.println("삼성 프린터");
		System.out.println(doc+"를 인쇄합니다.");
	}
	@Override
	public void printCMYK(String doc) {
		System.out.println("삼성 프린터");
		System.out.println("컬러로"+doc+"를 인쇄합니다.");
	}
}
