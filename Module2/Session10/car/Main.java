package session10.car;

public class Main {
	public static void main(String[] args) {
		Car car = new Car(10);
		
		car.printStatus();
		car.accelerate();
		car.accelerate(10);
		car.accelerate(10, 2);
		
		car.printStatus();
	}
}
