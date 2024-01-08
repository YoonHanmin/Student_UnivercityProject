package chapter06;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CalendarEx {
	public static void printCalendar(String msg,Calendar cal) {
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1; //컴퓨터는 달을 0~11로 인식
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		int hourOfDay = cal.get(Calendar.HOUR_OF_DAY);
		int ampm = cal.get(Calendar.AM_PM);
		int hour = cal.get(Calendar.HOUR);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		int millisecond = cal.get(Calendar.MILLISECOND);
		System.out.print(msg+":"+year+"-"+month+"-"+day+" ");
//		System.out.println(dayOfWeek); // 일요일 : 1 월요일 : 2,...
//		System.out.println(Calendar.FRIDAY);
	switch(dayOfWeek) {
	case Calendar.SUNDAY : System.out.println("일요일"); break;
	case Calendar.MONDAY : System.out.println("월요일"); break;
	case Calendar.TUESDAY : System.out.println("화요일"); break;
	case Calendar.WEDNESDAY : System.out.println("수요일"); break;
	case Calendar.THURSDAY : System.out.println("목요일"); break;
	case Calendar.FRIDAY : System.out.println("금요일"); break;
	case Calendar.SATURDAY : System.out.println("토요일"); break;
	default: break;
	}
	System.out.print("("+hourOfDay+"시)");
	if(ampm==Calendar.AM) {
		System.out.print("오전");
	}else { System.out.print("오후"); }
	System.out.println(hour+"시"+minute+"분"+second+"초"+millisecond+"밀리초");
	
	
	}
	
	public static void main(String[] args) {
		
//		Calendar now = new Calendar(); Calendar는 추상클래스라서 객체생성 못함.
		Calendar now = Calendar.getInstance(); //메소드를 통해 인스턴스를 생성
		printCalendar("현재",now);
		Calendar firstDate = Calendar.getInstance();
		firstDate.clear();
		firstDate.set(2019,11,30);
		firstDate.set(Calendar.HOUR_OF_DAY,20);
		firstDate.set(Calendar.MINUTE,30);
		printCalendar("처음 데이트한 날은", firstDate);
		String dateTime = new SimpleDateFormat("yyyy-MM-dd-HH:mm").format(new Date());
		System.out.println(dateTime);
		
	}
}
