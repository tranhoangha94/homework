package Session08.Storage;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Storage storage = new Storage();

        int choice;

        do {
            System.out.println("===== MENU SAN PHAM =====");
            System.out.println("1. Them san pham moi");
            System.out.println("2. In danh sach san pham");
            System.out.println("3. Tim san pham theo khoang gia");
            System.out.println("4. Thong ke so san pham da tao");
            System.out.println("0. Thoat");
            System.out.print("Lua chon cua ban: ");

            choice = Integer.parseInt(sc.nextLine());

            switch (choice) {
                case 1:
                    Product product = new Product();
                    product.input();
                    storage.addProduct(product);
                    System.out.println("Them san pham thanh cong.");
                    break;

                case 2:
                    storage.showProducts();
                    break;

                case 3:
                    System.out.print("Nhap gia thap nhat: ");
                    double minPrice = Double.parseDouble(sc.nextLine());

                    System.out.print("Nhap gia cao nhat: ");
                    double maxPrice = Double.parseDouble(sc.nextLine());

                    storage.searchByPrice(minPrice, maxPrice);
                    break;

                case 4:
                    storage.showTotalCreated();
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
