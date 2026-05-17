package Session08.CurrencyConverter;

import java.text.DecimalFormat;

public class CurrencyConverter {

    private static double rate = 26000;

    public static void setRate(double r) {
        if (r > 0) {
            rate = r;
        } else {
            System.out.println("Ty gia khong hop le.");
        }
    }

    public static double getRate() {
        return rate;
    }

    public static double toUSD(int vnd) {
        return vnd / rate;
    }

    public static String formatUSD(double usd) {
        DecimalFormat df = new DecimalFormat("#,##0.00");
        return df.format(usd);
    }
}