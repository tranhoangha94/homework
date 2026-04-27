package session02;

import java.util.Scanner;

public class ArmstrongNumber {

	public static int countKcharacter(int n) {
		int sum = 0;
		while (n > 0) {
			sum++;
			n = n / 10;
		}
		return sum;
	}

	public static boolean isArmStrong(int N) {
		int current = N;
//		int unit = N % 10;
		int k = countKcharacter(N);
//		int sum = (int) Math.pow((double) unit, (double) k);
		int sum = 0;
		while (current > 0) {
			int unit = current % 10;

			sum += (int) Math.pow((double) unit, (double) k);

  			current = current / 10;
		}

		return sum == N;
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Yêu cầu nhập số nguyên dương N: ");
		int N = sc.nextInt();
		while(N < 0) {
			System.out.println("Số nhập vào không hợp lệ, yêu cầu nhập lại: ");
			N = sc.nextInt();
		}
		
		System.out.println("Dãy Số Armstrong: ");

		for (int i = 0; i <= N; i++) {
			if (isArmStrong(i)) {
				System.out.print(i + " ");
			}
		}
		System.out.println();
	}

}
