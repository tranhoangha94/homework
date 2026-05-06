package session4;

import java.util.Scanner;

public class Salary {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        // Nhập số lượng nhân viên
        System.out.print("Nhập số lượng nhân viên: ");
        int n = sc.nextInt();

        // Khai báo mảng lương
        double[] salaries = new double[n];

        // Nhập lương từng nhân viên
        for (int i = 0; i < n; i++) {
            System.out.print("Nhập lương nhân viên " + (i + 1) + ": ");
            salaries[i] = sc.nextDouble();
        }

        int choice;

        do {
            // Menu
            System.out.println("\n--- QUẢN LÝ LƯƠNG NHÂN VIÊN ---");
            System.out.println("1. Xem danh sách lương");
            System.out.println("2. Sắp xếp lương");
            System.out.println("3. Tìm kiếm lương");
            System.out.println("4. Thống kê lương");
            System.out.println("5. Thoát");

            System.out.print("Lựa chọn của bạn: ");
            choice = sc.nextInt();

            switch (choice) {

                // Xem danh sách lương
                case 1:
                    System.out.println("Danh sách lương nhân viên:");

                    for (int i = 0; i < salaries.length; i++) {
                        System.out.println("Nhân viên " + (i + 1) + ": " + salaries[i]);
                    }

                    break;

                // Sắp xếp lương
                case 2:

                    System.out.println("Chọn cách sắp xếp:");
                    System.out.println("1. Tăng dần");
                    System.out.println("2. Giảm dần");

                    int sortChoice = sc.nextInt();

                    // Bubble Sort
                    for (int i = 0; i < salaries.length - 1; i++) {

                        for (int j = 0; j < salaries.length - 1 - i; j++) {

                            if (sortChoice == 1) {

                                // Tăng dần
                                if (salaries[j] > salaries[j + 1]) {

                                    double temp = salaries[j];
                                    salaries[j] = salaries[j + 1];
                                    salaries[j + 1] = temp;
                                }

                            } else if (sortChoice == 2) {

                                // Giảm dần
                                if (salaries[j] < salaries[j + 1]) {

                                    double temp = salaries[j];
                                    salaries[j] = salaries[j + 1];
                                    salaries[j + 1] = temp;
                                }
                            }
                        }
                    }

                    System.out.println("Đã sắp xếp lương.");

                    System.out.println("Danh sách sau sắp xếp:");

                    for (int i = 0; i < salaries.length; i++) {
                        System.out.println("Nhân viên " + (i + 1) + ": " + salaries[i]);
                    }

                    break;

                // Tìm kiếm lương
                case 3:

                    System.out.print("Nhập lương cần tìm: ");
                    double target = sc.nextDouble();

                    // Linear Search
                    boolean foundLinear = false;

                    for (int i = 0; i < salaries.length; i++) {

                        if (salaries[i] == target) {

                            System.out.println("Linear Search: Tìm thấy tại vị trí " + i);
                            foundLinear = true;
                        }
                    }

                    if (!foundLinear) {
                        System.out.println("Linear Search: Không tìm thấy");
                    }

                    // Binary Search
                    int left = 0;
                    int right = salaries.length - 1;

                    boolean foundBinary = false;

                    while (left <= right) {

                        int mid = (left + right) / 2;

                        if (salaries[mid] == target) {

                            System.out.println("Binary Search: Tìm thấy tại vị trí " + mid);
                            foundBinary = true;
                            break;

                        } else if (salaries[mid] < target) {

                            left = mid + 1;

                        } else {

                            right = mid - 1;
                        }
                    }

                    if (!foundBinary) {
                        System.out.println("Binary Search: Không tìm thấy");
                    }

                    break;

                // Thống kê lương
                case 4:

                    double sum = 0;
                    double max = salaries[0];
                    double min = salaries[0];

                    // Tính tổng, max, min
                    for (int i = 0; i < salaries.length; i++) {

                        sum += salaries[i];

                        if (salaries[i] > max) {
                            max = salaries[i];
                        }

                        if (salaries[i] < min) {
                            min = salaries[i];
                        }
                    }

                    // Trung bình
                    double average = sum / salaries.length;

                    // Đếm số nhân viên trên trung bình
                    int countAboveAverage = 0;

                    for (int i = 0; i < salaries.length; i++) {

                        if (salaries[i] > average) {
                            countAboveAverage++;
                        }
                    }

                    System.out.println("Tổng lương: " + sum);
                    System.out.println("Lương trung bình: " + average);
                    System.out.println("Lương cao nhất: " + max);
                    System.out.println("Lương thấp nhất: " + min);
                    System.out.println("Số nhân viên có lương trên trung bình: " + countAboveAverage);

                    break;

                // Thoát
                case 5:
                    System.out.println("Thoát chương trình.");
                    break;

                default:
                    System.out.println("Lựa chọn không hợp lệ!");
            }

        } while (choice != 5);

        System.exit(0);
    }
}