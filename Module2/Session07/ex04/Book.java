package ex04;

public class Book {
	private String title;
	private String author;
	private double price;

	public Book() {
		// TODO Auto-generated constructor stub
	}

	public Book(String title, String author, double price) {
		super();
		this.title = title;
		this.author = author;
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void printInfo() {
		System.out.println("Tên sách: " + title);
		System.out.println("Tác giả: " + author);
		System.out.println("Giá sách: " + price);
	}
}
