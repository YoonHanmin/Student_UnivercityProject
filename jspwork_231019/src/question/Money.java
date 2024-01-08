package question;

public class Money {
	private int money;

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}
	
	public String process() {
		int[] unit = {50000,10000,1000,500,100,50,10,1};
		StringBuffer stb = new StringBuffer();
		for (int i = 0; i < unit.length; i++) {
			int res = money/unit[i];
			if(res>0) {
				stb.append(unit[i]+"원짜리:"+res+"개<br>");
				money = money%unit[i];
			}
		}
		
		return stb.toString();
	}
	
	
}
