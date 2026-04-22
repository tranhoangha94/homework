package ex05;

import java.util.Scanner;

public class Main {
public static void main(String[] args) {
	Scanner sc = new Scanner(System.in);
	
	System.out.print("Nhap cân nặng cao: ");
	float weight = sc.nextInt();
	
	System.out.print("Nhap chiều cao: ");
	float height = sc.nextInt();
	
	
	System.out.println("Chỉ số BMI la: "+ (weight / Math.pow(height, 2)));
}
}
