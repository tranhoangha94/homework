package Sesssion05;

import java.util.Scanner;

public class ControlString {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        String str = "";
        int choice;

        do {

            System.out.println("\n************************ MENU ************************");
            System.out.println("1. Nhập chuỗi");
            System.out.println("2. Đếm số ký tự thường, hoa, số, đặc biệt");
            System.out.println("3. Đảo ngược chuỗi");
            System.out.println("4. Kiểm tra Palindrome");
            System.out.println("5. Chuẩn hóa chuỗi");
            System.out.println("6. Thoát");
            System.out.println("******************************************************");

            System.out.print("Lựa chọn của bạn: ");
            choice = Integer.parseInt(sc.nextLine());

            switch (choice) {

                // Nhập chuỗi
                case 1:

                    System.out.print("Nhập chuỗi: ");
                    str = sc.nextLine();

                    break;

                // Đếm ký tự
                case 2:

                    int lowerCase = 0;
                    int upperCase = 0;
                    int digit = 0;
                    int special = 0;

                    for (int i = 0; i < str.length(); i++) {

                        char ch = str.charAt(i);

                        if (Character.isLowerCase(ch)) {

                            lowerCase++;

                        } else if (Character.isUpperCase(ch)) {

                            upperCase++;

                        } else if (Character.isDigit(ch)) {

                            digit++;

                        } else if (ch != ' ') {

                            special++;
                        }
                    }

                    System.out.println("Số ký tự thường: " + lowerCase);
                    System.out.println("Số ký tự hoa: " + upperCase);
                    System.out.println("Số chữ số: " + digit);
                    System.out.println("Số ký tự đặc biệt: " + special);

                    break;

                // Đảo ngược chuỗi
                case 3:

                    String reverse = "";

                    for (int i = str.length() - 1; i >= 0; i--) {

                        reverse += str.charAt(i);
                    }

                    System.out.println("Chuỗi đảo ngược: " + reverse);

                    break;

                // Kiểm tra Palindrome
                case 4:

                    String reversed = "";

                    for (int i = str.length() - 1; i >= 0; i--) {

                        reversed += str.charAt(i);
                    }

                    if (str.equalsIgnoreCase(reversed)) {

                        System.out.println("Chuỗi là Palindrome.");

                    } else {

                        System.out.println("Chuỗi không phải Palindrome.");
                    }

                    break;

                // Chuẩn hóa chuỗi
                case 5:

                    // Xóa khoảng trắng dư thừa
                    str = str.trim().replaceAll("\\s+", " ");

                    // Viết hoa chữ cái đầu
                    if (!str.isEmpty()) {

                        str = str.substring(0, 1).toUpperCase()
                                + str.substring(1).toLowerCase();
                    }

                    System.out.println("Chuỗi sau khi chuẩn hóa: " + str);

                    break;

                // Thoát
                case 6:

                    System.out.println("Tạm biệt!");
                    break;

                default:

                    System.out.println("Lựa chọn không hợp lệ!");
            }

        } while (choice != 6);

        System.exit(0);
    }
}