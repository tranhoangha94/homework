package session02;

import java.util.Scanner;

public class KiemTraTamGiac {
	public static boolean isPitagore(int a, int b, int c) {
		return a*a == b*b + c*c || b*b == a*a + c* c || c*c == a*a + b*b;
	}
	public static void PhanLoaiTamGiac(int a, int b, int c) {
		if (a == b || b == c || c == a) {
			if (a == b && b == c) {
				System.out.println("Tam giác đều");
			} else {
				System.out.println("Tam giác cân");
			}
		} else if (isPitagore(a,b,c)) {
			System.out.println("Tam giác vuông");
		}

	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Nhập 3 cạnh tam giác");
		int a = sc.nextInt();
		int b = sc.nextInt();
		int c = sc.nextInt();

		while (a + b <= c || b + c <= a || a + c <= b) {
			System.out.println("Ba cạnh không tạo thành tam giác. Đề nghị nhập lại: ");
			a = sc.nextInt();
			b = sc.nextInt();
			c = sc.nextInt();
		}
		PhanLoaiTamGiac(a,b,c);
	}
}
