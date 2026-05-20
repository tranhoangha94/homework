package session10.car;

public class Car {
	private int currentSpeed;
	
	public Car() {
		// TODO Auto-generated constructor stub
	}

	public Car(int currentSpeed) {
		super();
		this.currentSpeed = currentSpeed;
	}

	public int getCurrentSpeed() {
		return currentSpeed;
	}

	public void setCurrentSpeed(int currentSpeed) {
		this.currentSpeed = currentSpeed;
	}
	
	public void accelerate() {
		currentSpeed += 10;
		System.out.println("Car accelerates by default: +10 km/h");
	}

	public void accelerate(int speed) {
		currentSpeed += speed;
		System.out.println("Car accelerates by " + speed + " km/h");
	}
	
	public void accelerate(int speed, int seconds) {
		int increase = speed * seconds;
		currentSpeed += increase;
		System.out.println("Car accelerates " + increase + " km/h ("+speed+" x "+seconds+")");
	}
	
	public void printStatus() {
		System.out.println("Current speed: " + currentSpeed + " km/h");
	}
}
