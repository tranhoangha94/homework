package vehicle;

public class MotorCycle extends MotorVehicle {

 public MotorCycle(String brand, int year, String fuelType) {
     super(brand, year, fuelType);
 }

 @Override
 public void startEngine() {
     System.out.println(brand + " (Motorcycle) engine starts: Brum Brum!");
 }

 public void doWheelie() {
     System.out.println(brand + " is doing a wheelie!");
 }
}