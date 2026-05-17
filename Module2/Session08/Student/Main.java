package Session08.Student;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ArrayList<Student> students = new ArrayList<>();

        int choice;

        do {
            System.out.println("===== MENU SINH VIEN =====");
            System.out.println("1. Nhap danh sach sinh vien");
            System.out.println("2. In danh sach sinh vien");
            System.out.println("3. Tim sinh vien GPA cao nhat");
            System.out.println("4. In tong so sinh vien da tao");
            System.out.println("0. Thoat");
            System.out.print("Lua chon cua ban: ");

            choice = Integer.parseInt(sc.nextLine());

            switch (choice) {
                case 1:
                    System.out.print("Nhap so luong sinh vien: ");
                    int n = Integer.parseInt(sc.nextLine());

                    for (int i = 0; i < n; i++) {
                        System.out.println("Nhap sinh vien thu " + (i + 1));
                        Student student = new Student();
                        student.input();
                        students.add(student);
                    }
                    break;

                case 2:
                    if (students.isEmpty()) {
                        System.out.println("Danh sach sinh vien trong.");
                    } else {
                        for (Student student : students) {
                            student.print();
                        }
                    }
                    break;

                case 3:
                    if (students.isEmpty()) {
                        System.out.println("Danh sach sinh vien trong.");
                    } else {
                        Student maxStudent = students.get(0);

                        for (Student student : students) {
                        	System.out.println("===================");
                            if (student.getGpa() > maxStudent.getGpa()) {
                                maxStudent = student;
                            }
                        }

                        System.out.println("Sinh vien co GPA cao nhat:");
                        maxStudent.print();
                    }
                    break;

                case 4:
                    System.out.println("Tong so sinh vien da tao: " + Student.getTotalStudent());
                    break;

                case 0:
                    System.out.println("Thoat chuong trinh.");
                    break;

                default:
                    System.out.println("Lua chon khong hop le.");
            }

        } while (choice != 0);
    }
}