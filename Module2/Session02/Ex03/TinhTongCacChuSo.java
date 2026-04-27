package session02;

import java.util.Scanner;

public class TinhTongCacChuSo {
public static void main(String[] args) {
	Scanner sc = new Scanner(System.in);
	
	int N = sc.nextInt();
	
	if (N < 0) {
		N = -N;
	}
	int sum = 0;
	while (N > 0) {
		sum += N%10;
		N /= 10;
	}
	System.out.println("Tổng các chữ số là: "+sum);
}
}
