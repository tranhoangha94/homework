package Session09.book;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Book[] books = new Book[3];
		Scanner sc = new Scanner(System.in);

		for (int i = 0; i < books.length; i++) {
			books[i] = new Book();
			books[i].inputInfor(sc);
		}
		System.out.println("======================");
		for (int i = 0; i < books.length; i++) {
			books[i].printInfo();
		}
	}
}
