package session4;

import java.util.Scanner;

public class StudentScores {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        // Nhập số lượng sinh viên
        System.out.print("Nhập số lượng sinh viên: ");
        int n = sc.nextInt();

        // Khai báo mảng điểm
        double[] scores = new double[n];

        // Nhập điểm từng sinh viên
        for (int i = 0; i < scores.length; i++) {

            System.out.print("Nhập điểm sinh viên thứ " + (i + 1) + ": ");
            scores[i] = sc.nextDouble();
        }

        int choice;

        do {

            // Menu
            System.out.println("\n--- QUẢN LÝ ĐIỂM SINH VIÊN ---");
            System.out.println("1. Xem tất cả điểm");
            System.out.println("2. Sắp xếp điểm");
            System.out.println("3. Tìm kiếm điểm");
            System.out.println("4. Thống kê điểm");
            System.out.println("5. Thoát");

            System.out.print("Lựa chọn của bạn: ");
            choice = sc.nextInt();

            switch (choice) {

                // Xem tất cả điểm
                case 1:

                    System.out.println("Danh sách điểm:");

                    for (int i = 0; i < scores.length; i++) {

                        System.out.println("Sinh viên " + (i + 1) + ": " + scores[i]);
                    }

                    break;

                // Sắp xếp điểm
                case 2:

                    System.out.println("Chọn cách sắp xếp:");
                    System.out.println("1. Tăng dần");
                    System.out.println("2. Giảm dần");

                    int sortChoice = sc.nextInt();

                    // Bubble Sort
                    for (int i = 0; i < scores.length - 1; i++) {

                        for (int j = 0; j < scores.length - 1 - i; j++) {

                            // Tăng dần
                            if (sortChoice == 1) {

                                if (scores[j] > scores[j + 1]) {

                                    double temp = scores[j];
                                    scores[j] = scores[j + 1];
                                    scores[j + 1] = temp;
                                }
                            }

                            // Giảm dần
                            else if (sortChoice == 2) {

                                if (scores[j] < scores[j + 1]) {

                                    double temp = scores[j];
                                    scores[j] = scores[j + 1];
                                    scores[j + 1] = temp;
                                }
                            }
                        }
                    }

                    if (sortChoice == 1) {
                        System.out.println("Đã sắp xếp tăng dần.");
                    } else if (sortChoice == 2) {
                        System.out.println("Đã sắp xếp giảm dần.");
                    } else {
                        System.out.println("Lựa chọn không hợp lệ!");
                    }

                    System.out.println("Danh sách điểm sau sắp xếp:");

                    for (int i = 0; i < scores.length; i++) {

                        System.out.println("Sinh viên " + (i + 1) + ": " + scores[i]);
                    }

                    break;

                // Tìm kiếm điểm
                case 3:

                    System.out.print("Nhập điểm cần tìm: ");
                    double target = sc.nextDouble();

                    // Linear Search
                    boolean foundLinear = false;

                    for (int i = 0; i < scores.length; i++) {

                        if (scores[i] == target) {

                            System.out.println("Tìm kiếm tuyến tính: Tìm thấy tại vị trí " + i);
                            foundLinear = true;
                        }
                    }

                    if (!foundLinear) {

                        System.out.println("Tìm kiếm tuyến tính: Không tìm thấy");
                    }

                    // Binary Search
                    int left = 0;
                    int right = scores.length - 1;

                    boolean foundBinary = false;

                    while (left <= right) {

                        int mid = (left + right) / 2;

                        if (scores[mid] == target) {

                            System.out.println("Tìm kiếm nhị phân: Tìm thấy tại vị trí " + mid);
                            foundBinary = true;
                            break;

                        } else if (scores[mid] < target) {

                            left = mid + 1;

                        } else {

                            right = mid - 1;
                        }
                    }

                    if (!foundBinary) {

                        System.out.println("Tìm kiếm nhị phân: Không tìm thấy");
                    }

                    break;

                // Thống kê điểm
                case 4:

                    double sum = 0;
                    double max = scores[0];
                    double min = scores[0];

                    // Tính tổng, max, min
                    for (int i = 0; i < scores.length; i++) {

                        sum += scores[i];

                        if (scores[i] > max) {

                            max = scores[i];
                        }

                        if (scores[i] < min) {

                            min = scores[i];
                        }
                    }

                    // Điểm trung bình
                    double average = sum / scores.length;

                    // Đếm số sinh viên trên trung bình
                    int countAboveAverage = 0;

                    for (int i = 0; i < scores.length; i++) {

                        if (scores[i] > average) {

                            countAboveAverage++;
                        }
                    }

                    System.out.println("Điểm trung bình: " + average);
                    System.out.println("Điểm cao nhất: " + max);
                    System.out.println("Điểm thấp nhất: " + min);
                    System.out.println("Số sinh viên có điểm trên trung bình: " + countAboveAverage);

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