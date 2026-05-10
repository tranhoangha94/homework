package Sesssion05;

import java.util.Scanner;
import java.util.regex.Pattern;

public class CheckPassword {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        // Nhập mật khẩu
        System.out.print("Nhập mật khẩu: ");
        String password = sc.nextLine();

        // Regex kiểm tra mật khẩu
        String regex =
                "^(?=.*[a-z])" +     // ít nhất 1 chữ thường
                "(?=.*[A-Z])" +     // ít nhất 1 chữ hoa
                "(?=.*\\d)" +       // ít nhất 1 chữ số
                "(?=.*[@#$%!])" +   // ít nhất 1 ký tự đặc biệt
                ".{8,}$";           // tối thiểu 8 ký tự

        // Kiểm tra
        if (Pattern.matches(regex, password)) {

            System.out.println("Mật khẩu hợp lệ");

        } else {

            System.out.println("Mật khẩu không hợp lệ");
        }

    }
}