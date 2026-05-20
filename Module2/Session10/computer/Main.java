package session10.computer;

public class Main {
	public static final double BASE_PRICE = 1000;
	public static final double TAX = 100;
	public static final double DISCOUNT = 50;

	public static void main(String[] args) {
		Computer c = new Computer();

		System.out.println("Using base price only:");
		System.out.println("Final price = " + c.calculatePrice(BASE_PRICE));
		
		System.out.println("Using base price only + tax:");
		System.out.println("Final price = " + c.calculatePrice(BASE_PRICE, TAX));
		
		System.out.println("Using base price only + tax + discount:");
		System.out.println("Final price = " + c.calculatePrice(BASE_PRICE, TAX, DISCOUNT));
	}
}
