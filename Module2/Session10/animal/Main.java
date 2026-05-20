package session10.animal;

//ZooApp.java
import java.util.Scanner;

public class Main {
	public static void showMenu() {
		System.out.println("===== ZOO MANAGEMENT MENU =====");
		System.out.println("1. Tạo đối tượng và hiển thị thông tin");
		System.out.println("2. Kiểm tra Overriding: makeSound()");
		System.out.println("3. Kiểm tra Overloading: eat()");
		System.out.println("4. Kiểm tra đa hình runtime (Animal array)");
		System.out.println("5. Gọi phương thức đặc trưng từng loài");
		System.out.println("0. Thoát");
		System.out.println("===============================");
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		Animal[] animals = { new Dog("Buddy", 3, true), new Cat("Mimi", 2, true), new Elephant("Dumbo", 10, false) };

		int choice;

		do {
			showMenu();
			System.out.print("Chọn chức năng: ");
			choice = Integer.parseInt(sc.nextLine());

			switch (choice) {
			case 1:
				System.out.println("\n--- THÔNG TIN CÁC ĐỘNG VẬT ---");
				for (Animal animal : animals) {
					animal.showInfo();
				}
				break;

			case 2:
				System.out.println("\n--- OVERRIDING: makeSound() ---");
				for (Animal animal : animals) {
					animal.makeSound();
				}
				break;

			case 3:
				System.out.println("\n--- OVERLOADING: eat() ---");
				animals[0].eat();
				animals[0].eat("meat");
				animals[1].eat("fish");
				animals[2].eat();
				break;

			case 4:
				System.out.println("\n--- POLYMORPHISM RUNTIME ---");
				for (Animal animal : animals) {
					animal.makeSound();
				}
				break;

			case 5:
				System.out.println("\n--- PHƯƠNG THỨC RIÊNG CỦA TỪNG LOẠI ---");
				for (Animal animal : animals) {
					if (animal instanceof Dog) {
						((Dog) animal).fetchBall();
					} else if (animal instanceof Cat) {
						((Cat) animal).climbTree();
					} else if (animal instanceof Elephant) {
						((Elephant) animal).sprayWater();
					}
				}
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

}