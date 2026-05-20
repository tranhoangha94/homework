package session10.computer;

public class Computer {
	public Computer() {
		// TODO Auto-generated constructor stub
	}
	double calculatePrice(double basePrice) {
		return basePrice;
	}
	
	double calculatePrice(double basePrice, double tax) {
		return basePrice + tax;
	}
	
	double calculatePrice(double basePrice, double tax, double discount) {
		return basePrice + tax - discount;
	}
}
