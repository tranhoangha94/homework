package vehicle;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {
 public static void main(String[] args) {
     Scanner sc = new Scanner(System.in);

     ArrayList<Vehicle> vehicles = new ArrayList<>();
     vehicles.add(new Car("Toyota", 2020, "Gasoline"));
     vehicles.add(new MotorCycle("Honda", 2018, "Gasoline"));
     vehicles.add(new Truck("Volvo", 2022, "Diesel"));

     int choice;

     do {
         showMenu();
         System.out.print("Chọn chức năng: ");
         choice = Integer.parseInt(sc.nextLine());

         switch (choice) {
             case 1:
                 System.out.println("\n--- THÔNG TIN PHƯƠNG TIỆN ---");
                 for (Vehicle v : vehicles) {
                     v.showInfo();
                     System.out.println("--------------------");
                 }
                 break;

             case 2:
                 System.out.println("\n--- OVERRIDING: startEngine() ---");
                 for (Vehicle v : vehicles) {
                     v.startEngine();
                 }
                 break;

             case 3:
                 System.out.println("\n--- OVERLOADING: move() ---");
                 Vehicle vehicle = vehicles.get(0);
                 vehicle.move();
                 vehicle.move(80);
                 break;

             case 4:
                 System.out.println("\n--- POLYMORPHISM RUNTIME ---");
                 for (Vehicle v : vehicles) {
                     v.startEngine();
                 }
                 break;

             case 5:
                 System.out.println("\n--- HÀNH VI ĐẶC TRƯNG CỦA TỪNG LOẠI ---");
                 for (Vehicle v : vehicles) {
                     if (v instanceof Car) {
                         ((Car) v).openTrunk();
                     } else if (v instanceof MotorCycle) {
                         ((MotorCycle) v).doWheelie();
                     } else if (v instanceof Truck) {
                         ((Truck) v).loadCargo();
                     }
                 }
                 break;

             case 6:
                 System.out.println("\n--- THÊM PHƯƠNG TIỆN MỚI ---");
                 System.out.print("Loại (car/motorcycle/truck): ");
                 String type = sc.nextLine().toLowerCase();

                 System.out.print("Brand: ");
                 String brand = sc.nextLine();

                 System.out.print("Year: ");
                 int year = Integer.parseInt(sc.nextLine());

                 System.out.print("Fuel Type: ");
                 String fuelType = sc.nextLine();

                 if (type.equals("car")) {
                     vehicles.add(new Car(brand, year, fuelType));
                 } else if (type.equals("motorcycle")) {
                     vehicles.add(new MotorCycle(brand, year, fuelType));
                 } else if (type.equals("truck")) {
                     vehicles.add(new Truck(brand, year, fuelType));
                 } else {
                     System.out.println("Loại phương tiện không hợp lệ!");
                 }

                 System.out.println("Đã thêm phương tiện mới!");
                 break;

             case 0:
                 System.out.println("Thoát chương trình...");
                 break;

             default:
                 System.out.println("Lựa chọn không hợp lệ!");
         }

         System.out.println();

     } while (choice != 0);

     sc.close();
 }

 public static void showMenu() {
     System.out.println("========== VEHICLE MANAGEMENT MENU ==========");
     System.out.println("1. Hiển thị thông tin tất cả phương tiện");
     System.out.println("2. Kiểm tra Overriding: startEngine()");
     System.out.println("3. Kiểm tra Overloading: move()");
     System.out.println("4. Kiểm tra đa hình runtime (Vehicle array/list)");
     System.out.println("5. Gọi hành vi đặc trưng của từng loại");
     System.out.println("6. Thêm phương tiện mới");
     System.out.println("0. Thoát");
     System.out.println("=============================================");
 }
}