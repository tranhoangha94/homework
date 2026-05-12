package ex05;

public class Order {
	private int orderId;
	private double total;
	private Customer customer;

	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(int orderId, double total, Customer customer) {
		super();
		this.orderId = orderId;
		this.total = total;
		this.customer = customer;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public void printOrder() {

	}
}
