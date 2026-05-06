package session4;

import java.util.Scanner;

public class SortDescending {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        // Nhập số lượng phần tử
        System.out.print("Nhập số lượng phần tử của mảng: ");
        int n = sc.nextInt();

        // Khai báo mảng
        int[] arr = new int[n];

        // Nhập phần tử
        System.out.println("Nhập các phần tử của mảng:");

        for (int i = 0; i < arr.length; i++) {

            System.out.print("Phần tử thứ " + (i + 1) + ": ");
            arr[i] = sc.nextInt();
        }

        // Selection Sort giảm dần
        for (int i = 0; i < arr.length - 1; i++) {

            int maxIndex = i;

            for (int j = i + 1; j < arr.length; j++) {

                if (arr[j] > arr[maxIndex]) {

                    maxIndex = j;
                }
            }

            // Hoán đổi
            int temp = arr[i];
            arr[i] = arr[maxIndex];
            arr[maxIndex] = temp;
        }

        // In mảng sau sắp xếp
        System.out.println("Mảng sau khi sắp xếp giảm dần:");

        for (int i = 0; i < arr.length; i++) {

            System.out.print(arr[i] + " ");
        }

        System.out.println();

        // Nhập số cần tìm
        System.out.print("Nhập số cần tìm: ");
        int target = sc.nextInt();

        // Tìm kiếm tuyến tính
        boolean foundLinear = false;

        for (int i = 0; i < arr.length; i++) {

            if (arr[i] == target) {

                System.out.println("Tìm kiếm tuyến tính: Số "
                        + target + " có tại vị trí " + (i + 1));

                foundLinear = true;
                break;
            }
        }

        if (!foundLinear) {

            System.out.println("Tìm kiếm tuyến tính: Không tìm thấy số " + target);
        }

        // Tìm kiếm nhị phân trên mảng giảm dần
        int left = 0;
        int right = arr.length - 1;

        boolean foundBinary = false;

        while (left <= right) {

            int mid = (left + right) / 2;

            if (arr[mid] == target) {

                System.out.println("Tìm kiếm nhị phân: Số "
                        + target + " có tại vị trí " + (mid + 1));

                foundBinary = true;
                break;

            } else if (arr[mid] < target) {

                right = mid - 1;

            } else {

                left = mid + 1;
            }
        }

        if (!foundBinary) {

            System.out.println("Tìm kiếm nhị phân: Không tìm thấy số " + target);
        }

    }
}