package quiz;

public class PrinterEx {
	public static void prtWork(Printer print) {
		print.print("자바 이론 문서");
	}

	public static void main(String[] args) {
		SamsungPrinter s = new SamsungPrinter();
		prtWork(new SamsungPrinter());
		s.printCMYK("자바 이론 문서");
		prtWork(new LGPrinter());
	}
}