package area;

public class Circle {
	private double PI = 3.14;
	private int radius = 10;
	public double getPI() {
		return PI;
	}


	public void setPI(double pI) {
		PI = pI;
	}


	public int getRadius() {
		return radius;
	}


	public void setRadius(int radius) {
		this.radius = radius;
	}


	
	
	public double process() {
		return getPI()*getRadius()*getRadius();
	}
	
	
	
}
