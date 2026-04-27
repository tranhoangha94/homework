package session02;

import java.util.Scanner;

public class DocSoThanhChu {

	public static String hangDonVi(int i) {
		switch (i) {
		case 0:
			return "";
		case 1:
			return "một";
		case 2:
			return "hai";
		case 3:
			return "ba";
		case 4:
			return "bốn";
		case 5:
			return "năm";
		case 6:
			return "sáu";
		case 7:
			return "bảy";

		case 8:
			return "tám";

		case 9:
			return "chín";

		default:
			return "";
		}
	}
	
	public static String hangChuc(int x, int y) {
		if (x == 0) {
			if (y == 0) {
				return "";
			} else {
				return "lẻ";
			}
		} else if (x == 1) {
			return "mười";
		}  else {
			return hangDonVi(x)+ " mươi";
		}
	}
	
	public static String hangTram(int x) {
		return hangDonVi(x) + " trăm";
	}


	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Yêu cầu nhập số có 3 chữ số: ");
		int N = sc.nextInt();
		while (N < 100 || N >= 1000) {
			System.out.println("Số nhập vào không hợp lệ, yêu cầu nhập lại: ");
			N = sc.nextInt();
		}
		
		int donvi = N%10;
		int chuc = (N/10) %10;
		int tram = (N/100) % 10;
		
		System.out.println(hangTram(tram)+ " "+hangChuc(chuc, donvi)+ " "+hangDonVi(donvi));
	}
}
