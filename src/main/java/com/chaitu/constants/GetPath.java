package com.chaitu.constants;

import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;

public class GetPath {

	public String getPath(){
		// URL returned "/C:/Program%20Files/Tomcat%206.0/webapps/myapp/WEB-INF/classes/"
				URL r = this.getClass().getResource("/");
				 
				// path decoded "/C:/Program Files/Tomcat 6.0/webapps/myapp/WEB-INF/classes/"
				String decoded = null;
				try {
					decoded = URLDecoder.decode(r.getFile(), "UTF-8");
				} catch (UnsupportedEncodingException e) {}
				if (decoded.startsWith("/")) {
				    // path "C:/Program Files/Tomcat 6.0/webapps/myapp/WEB-INF/classes/"
				    decoded = decoded.replaceFirst("/", "");
				}
				
				decoded = decoded+"resources/";
				
				return decoded;
	}
}
