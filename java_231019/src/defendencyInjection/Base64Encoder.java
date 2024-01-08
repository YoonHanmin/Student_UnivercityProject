package defendencyInjection;

import java.util.Base64;

public class Base64Encoder implements IEncoder {

	@Override
	public String encode(String message) {
		String resultEncode = Base64.getEncoder().encodeToString(message.getBytes());
		return null;
	}

}
