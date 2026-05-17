package Session08.CurrencyConverter;

public class Main {
	public static void main(String[] args) {

		CurrencyConverter.setRate(26000);

		int vnd = 1000000;

		double usd = CurrencyConverter.toUSD(vnd);

		System.out.println("Ty gia hien tai: " + CurrencyConverter.getRate());

		System.out.println(vnd + " VND = " + CurrencyConverter.formatUSD(usd) + " USD");
	}
}