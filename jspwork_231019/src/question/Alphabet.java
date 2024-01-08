package question;

public class Alphabet {
	private String str;
	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	
	public String process() {
		StringBuffer strbuf = new StringBuffer();
		char c='a';
		char c2= str.charAt(0);
		do {
			strbuf.append(c);
			c=(char)(c+1);
		}while(c<=c2);
		return strbuf.toString();
				
	}
	
	
	
	
	
	
}
