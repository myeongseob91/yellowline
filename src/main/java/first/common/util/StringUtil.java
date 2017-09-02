package first.common.util;

public class StringUtil {

	
	public static String nullCheck(String value) {
		if(value == null || "".equals(value) || "null".equals(value) || value.length()==0) {
			return "";
		}else {
			return value;
		}
	}
}
