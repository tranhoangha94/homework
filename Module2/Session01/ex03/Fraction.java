package phanso;

import java.util.Scanner;

public class Fraction {

	public static int gcd(int a, int b) {
		a = Math.abs(a);
		b = Math.abs(b);
		while (b != 0) {
			int temp = b;
			b = a % b;
			a = temp;
		}
		return a;
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		System.out.println("Nhap tu so thu nhat ");
		int numerator1 = sc.nextInt();

		System.out.println("Nhap mau so thu nhat ");
		int denominator1 = sc.nextInt();

		System.out.println("Nhap tu so thu hai ");
		int numerator2 = sc.nextInt();

		System.out.println("Nhap mau so thu hai ");
		int denominator2 = sc.nextInt();

		int gdc = gcd(numerator1 * denominator2 + denominator1 * numerator2, denominator1 * denominator2);
		int num = (numerator1 * denominator2 + denominator1 * numerator2) / gdc;
		int den = denominator1 * denominator2 / gdc;

		if (num % den == 0) {
			System.out.println("Tong 2 phan so = " + num / den);
		} else {
			System.out.println("Tong 2 phan so = " + num + "/" + den);
		}

//	System.out.println("Tong 2 phan so = "+ (float) (numerator1*denominator2 + denominator1*numerator2)/(denominator1* denominator2));
	}
}
