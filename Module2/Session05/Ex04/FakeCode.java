package Sesssion05;

import java.util.Random;
import java.util.Scanner;

public class FakeCode {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        Random random = new Random();

        // Chuỗi chứa các ký tự hợp lệ
        String characters =
                "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
              + "abcdefghijklmnopqrstuvwxyz"
              + "0123456789";

        // Nhập độ dài chuỗi
        System.out.print("Nhập độ dài chuỗi n: ");
        int n = sc.nextInt();

        // Kiểm tra điều kiện
        if (n < 1 || n > 1000) {

            System.out.println("n phải nằm trong khoảng từ 1 đến 1000");
            return;
        }

        // Dùng StringBuilder để tối ưu hiệu năng
        StringBuilder result = new StringBuilder();

        // Sinh chuỗi ngẫu nhiên
        for (int i = 0; i < n; i++) {

            int index = random.nextInt(characters.length());

            result.append(characters.charAt(index));
        }

        // In kết quả
        System.out.println("Chuỗi ngẫu nhiên:");
        System.out.println(result);

    }
}