package Session08.Rectangle;

public class Main {
    public static void main(String[] args) {

        Rectangle r1 = new Rectangle(3, 4);
        Rectangle r2 = new Rectangle(5, 2);
        Rectangle r3 = new Rectangle(4.5, 3.5);

        System.out.println(r1);
        System.out.println(r2);
        System.out.println(r3);

        Rectangle maxRectangle = r1;

        if (r2.getArea() > maxRectangle.getArea()) {
            maxRectangle = r2;
        }

        if (r3.getArea() > maxRectangle.getArea()) {
            maxRectangle = r3;
        }

        System.out.println("\nHinh co dien tich lon nhat:");
        System.out.println(maxRectangle);

        if (r1.getArea() == r2.getArea()
                || r1.getArea() == r3.getArea()
                || r2.getArea() == r3.getArea()) {

            System.out.println("Co nhieu hinh co cung dien tich lon nhat.");
        }
    }
}
