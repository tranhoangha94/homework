package Session08.Student;

import java.util.Scanner;

public class Student {
    private int id;
    private String name;
    private double gpa;

    public static int countStudent = 0;
    public final double SCORE_FACTOR = 0.25;

    public Student() {
        countStudent++;
    }

    public Student(int id, String name, double gpa) {
        this();
        this.id = id;
        this.name = name;
        this.gpa = gpa;
    }

    public void input() {
        Scanner sc = new Scanner(System.in);

        System.out.print("Nhap ma sinh vien: ");
        this.id = Integer.parseInt(sc.nextLine());

        System.out.print("Nhap ho ten: ");
        this.name = sc.nextLine();

        System.out.print("Nhap GPA: ");
        this.gpa = Double.parseDouble(sc.nextLine());
    }

    public void print() {
        System.out.println("ID: " + id 
                + " | Ten: " + name 
                + " | GPA: " + gpa 
                + " | Diem quy doi: " + (gpa * SCORE_FACTOR));
    }

    public double getGpa() {
        return gpa;
    }

    public static int getTotalStudent() {
        return countStudent;
    }
}
