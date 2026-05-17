package Session08.Storage;

import java.util.Scanner;

public class Product {
    private int id;
    private String name;
    private double price;

    public static int AUTO_ID = 0;
    public final String WAREHOUSE_CODE = "KHO-01";

    public Product() {
        this.id = ++AUTO_ID;
    }

    public Product(String name, double price) {
        this.id = AUTO_ID++;
        this.name = name;
        this.price = price;
    }

    public void input() {
        Scanner sc = new Scanner(System.in);

        System.out.print("Nhap ten san pham: ");
        this.name = sc.nextLine();

        System.out.print("Nhap gia san pham: ");
        this.price = Double.parseDouble(sc.nextLine());
    }

    public void print() {
        System.out.println("ID: " + id 
                + " | Ten: " + name 
                + " | Gia: " + price 
                + " | Ma kho: " + WAREHOUSE_CODE);
    }

    public double getPrice() {
        return price;
    }
}