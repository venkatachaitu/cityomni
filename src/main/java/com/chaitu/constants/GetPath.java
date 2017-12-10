package com.chaitu.constants;

import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;

import org.springframework.context.annotation.Configuration;
@Configuration
public class GetPath {

	public String getPath(){
		// URL returned "/C:/Program%20Files/Tomcat%206.0/webapps/myapp/WEB-INF/classes/"
				URL r = this.getClass().getResource("./");
				// path decoded "/C:/Program Files/Tomcat 6.0/webapps/myapp/WEB-INF/classes/"
				String decoded = null;
				try {
					decoded = URLDecoder.decode(r.getFile(), "UTF-8");
				} catch (UnsupportedEncodingException e) {}
				if (decoded.startsWith("/")) {
				    // path "C:/Program Files/Tomcat 6.0/webapps/myapp/WEB-INF/classes/"
				    decoded = decoded.replaceFirst("/", "");
				}
				
				//decoded = decoded+"src/main/webapp/data/";
				 
				System.out.println("server location : "+decoded);
				
				return "/app/src/main/webapp/data/";
				
				//return "D:/test-workspace/cityhaltweb/src/main/webapp/data/";
					//"/app/src/main/webapp/data/";//decoded;
	}
}
