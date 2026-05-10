package Sesssion05;

import java.util.Arrays;
import java.util.Scanner;

public class Student {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        String[] students = new String[100];
        int count = 0;

        int choice;

        do {
            System.out.println("\n========== QUẢN LÝ TÊN SINH VIÊN ==========");
            System.out.println("1. Thêm tên sinh viên");
            System.out.println("2. Hiển thị danh sách");
            System.out.println("3. Tìm tên sinh viên chứa từ khóa");
            System.out.println("4. Đếm số sinh viên có tên bắt đầu bằng chữ cái nhập vào");
            System.out.println("5. Sắp xếp danh sách tên theo thứ tự A-Z");
            System.out.println("6. Thoát");
            System.out.println("==========================================");

            System.out.print("Chọn: ");
            choice = Integer.parseInt(sc.nextLine());

            switch (choice) {

                case 1:
                    System.out.print("Nhập tên sinh viên: ");
                    String name = sc.nextLine();

                    students[count] = name;
                    count++;

                    System.out.println("Đã thêm: " + name);
                    break;

                case 2:
                    System.out.println("Danh sách sinh viên:");

                    if (count == 0) {
                        System.out.println("Danh sách rỗng.");
                    } else {
                        for (int i = 0; i < count; i++) {
                            System.out.println((i + 1) + ". " + students[i]);
                        }
                    }

                    break;

                case 3:
                    System.out.print("Nhập từ khóa: ");
                    String keyword = sc.nextLine();

                    System.out.println("Kết quả tìm kiếm:");

                    boolean found = false;

                    for (int i = 0; i < count; i++) {

                        if (students[i].toLowerCase().contains(keyword.toLowerCase())) {
                            System.out.println("- " + students[i]);
                            found = true;
                        }
                    }

                    if (!found) {
                        System.out.println("Không tìm thấy sinh viên nào.");
                    }

                    break;

                case 4:
                    System.out.print("Nhập chữ cái: ");
                    String letter = sc.nextLine();

                    int total = 0;

                    for (int i = 0; i < count; i++) {

                        if (students[i].toLowerCase().startsWith(letter.toLowerCase())) {
                            total++;
                        }
                    }

                    System.out.println("Số sinh viên có tên bắt đầu bằng '" + letter + "': " + total);
                    break;

                case 5:
                    Arrays.sort(students, 0, count);

                    System.out.println("Danh sách đã được sắp xếp A-Z.");
                    break;

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