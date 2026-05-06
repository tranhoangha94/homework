package session4;

import java.util.Scanner;

public class SortEvenOdd {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        // Nhập số phần tử
        System.out.print("Nhập số phần tử của mảng: ");
        int n = sc.nextInt();

        // Kiểm tra mảng rỗng
        if (n <= 0) {

            System.out.println("Mảng không có phần tử");
            return;
        }

        // Khai báo mảng
        int[] arr = new int[n];

        // Nhập phần tử
        for (int i = 0; i < arr.length; i++) {

            System.out.print("Nhập phần tử thứ " + (i + 1) + ": ");
            arr[i] = sc.nextInt();
        }

        // Mảng kết quả
        int[] result = new int[n];

        int index = 0;

        // Đưa số chẵn vào trước
        for (int i = 0; i < arr.length; i++) {

            if (arr[i] % 2 == 0) {

                result[index] = arr[i];
                index++;
            }
        }

        // Đưa số lẻ vào sau
        for (int i = 0; i < arr.length; i++) {

            if (arr[i] % 2 != 0) {

                result[index] = arr[i];
                index++;
            }
        }

        // In kết quả
        System.out.println("Mảng sau khi sắp xếp:");

        for (int i = 0; i < result.length; i++) {

            System.out.print(result[i] + " ");
        }

        sc.close();
    }
}