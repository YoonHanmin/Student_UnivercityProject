package defendencyInjection;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class UrlEncoder implements IEncoder{

	@Override
	public String encode(String message) {
		// TODO Auto-generated method stub
		try {
			return URLEncoder.encode(message,"utf-8");
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return null;
	}
	

}
