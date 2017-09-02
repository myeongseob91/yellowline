package first.common.util;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PropertiesControll {
	private static final Log LOG = LogFactory.getLog(PropertiesControll.class);
	
	private static final char FILE_SEPARATOR = File.separatorChar;
	
	public static String getProperty(String category, String code) {
		String name = "".equals(StringUtil.nullCheck(category))?code:category+"."+code;
		
		Properties prop = new Properties();
		   ClassLoader cl;
			cl = Thread.currentThread().getContextClassLoader();

			URL url = cl.getResource("properties"+FILE_SEPARATOR+"Global.properties");
			try {
				prop.load(url.openStream());
			} catch (IOException e) {
				e.printStackTrace();
			}
		   String value = prop.getProperty(name);
		   LOG.debug("value:"+value);
		return value;
	}
}
