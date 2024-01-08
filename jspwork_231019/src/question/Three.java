package question;

public class Three {
	private int num;
	private String res;

	public String process(int num) {
		int count=0;
		int fir = num/10;
		int sec = num%10;
		if(num<10&&sec%3==0) {
				count = 1;
			}
		else if(num>=10) {
			if(fir%3==0&&sec%3==0) {
				count =2;
			}else if (fir%3==0||sec%3==0) {
				count =1;
			}
		}
		
		if(count==1) {
		return res = "박수짝";
		}else if(count==2) {
			return res="박수 짝짝";
		}
		
		return res;
		
		

	}
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getRes() {
		return res;
	}
	public void setRes(String res) {
		this.res = res;
	}
	
}
