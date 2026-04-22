package ex06;

import java.util.Scanner;

public class Main {
public static void main(String[] args) {
	Scanner sc = new Scanner(System.in);
	
	
	int velocity;
    while (true) {
        System.out.print("Nhap van toc (km/h): ");
        velocity = sc.nextInt();
        if (velocity >= 0) break;
        System.out.println("Van toc khong duoc < 0, vui long nhap lai!");
    }

    int time;
    while (true) {
        System.out.print("Nhap thoi gian (hour): ");
        time = sc.nextInt();
        if (time >= 0) break;
        System.out.println("Thoi gian khong duoc < 0, vui long nhap lai!");
    }
	
	System.out.println("Quang duong di la: "+ (velocity * time)+ " km/h");
}
}
