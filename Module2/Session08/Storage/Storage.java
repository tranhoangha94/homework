package Session08.Storage;

import java.util.ArrayList;

public class Storage {
    private ArrayList<Product> products = new ArrayList<>();

    public void addProduct(Product product) {
        products.add(product);
    }

    public void showProducts() {
        if (products.isEmpty()) {
            System.out.println("Danh sach san pham trong.");
            return;
        }

        for (Product product : products) {
            product.print();
        }
    }

    public void searchByPrice(double minPrice, double maxPrice) {
        boolean found = false;

        for (Product product : products) {
            if (product.getPrice() >= minPrice && product.getPrice() <= maxPrice) {
                product.print();
                found = true;
            }
        }

        if (!found) {
            System.out.println("Khong tim thay san pham trong khoang gia nay.");
        }
    }

    public void showTotalCreated() {
        System.out.println("So san pham da tao: " + Product.AUTO_ID);
        for (Product product : products) {
        	System.out.println("=================");
            product.print();
        }
    }
}