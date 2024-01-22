package sec01.exam;

import java.util.Scanner;

public class BoardSys {
	public static Scanner sc = new Scanner(System.in);
	public static Board[] boards = new Board[50];

	public static void main(String[] args) {
		// 게시판
		Controller a = new Controller();
		a.init();
		sc.close();
	}
}