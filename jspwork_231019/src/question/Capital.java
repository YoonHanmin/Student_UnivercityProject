package question;

public class Capital {
	private String str;

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}
	
	public String process() {
		StringBuffer stb = new StringBuffer();
		char c = 'A';
		char c2 = str.charAt(0);
		
		
		for (char i = c2; i > 0; i--) {
			for (char j = c; j < i; j++) {
				stb.append(j);
				
			}
			stb.append("<br>");
		}
		return stb.toString();
		
	}
	
	
}
