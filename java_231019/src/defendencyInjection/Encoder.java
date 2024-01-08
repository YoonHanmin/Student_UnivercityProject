package defendencyInjection;

public class Encoder {
	private IEncoder iEncoder;
	
	public Encoder(IEncoder iEncoder) {
		this.iEncoder=iEncoder;
	}
	public void setiEncoder(IEncoder iEncoder) {
		this.iEncoder=iEncoder;
	}
	
	public String encode(String message) {
		return iEncoder.encode(message);
	}
	
	
	public static void main(String[] args) {
	Encoder encoder = new Encoder(new UrlEncoder());
		
		
		
	}
	
	
}
