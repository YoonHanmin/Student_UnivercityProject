package question;

public class Array3 {
	private int num;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
//	public String process() {
//		StringBuffer stb = new StringBuffer();
//		int[] arr = new int[num];
//		boolean[] arr2 = new boolean[101];
//		for (int i = 0; i < arr.length; i++) {
//				int ran = (int) Math.random()*100+1;
//				arr2[ran] = true;
//				if(arr2[ran]!=true) {
//					arr[i]= ran;
//					stb.append(arr[i]);
//				}else {
//					i--;
//					continue;
//				}
//		}
//		return stb.toString();
//				
//	}
	
	public String process() {
		int array[] = new int[num];
		StringBuffer stb = new StringBuffer();
		for (int i = 0; i < array.length; i++) {
			int r = (int) (Math.random()*100);
			array[i] = r;
			if(i==0) {
				stb.append(array[i]+" ");
			}else {
				if(i%10 ==0) {
					stb.append(array[i]+"<br>");
				}
				stb.append(array[i]+" ");
			}
	}
	return stb.toString();
}
}