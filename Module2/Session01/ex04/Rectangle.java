package ex04;

import java.util.Scanner;

public class Rectangle {
 public static void main(String[] args) {
	 Scanner sc = new Scanner(System.in);
		
		System.out.print("Nhap chiều dài HCN: ");
		float length = sc.nextInt();
		
		System.out.print("Nhap chiều rộng: ");
		float wide = sc.nextInt();
		
		
		System.out.println("Chu vi HCN là: "+ 2*(length + wide));
		
		System.out.println("Diện tích HCN là: "+ length * wide);
}
}
