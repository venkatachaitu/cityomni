package com.chaitu.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
//import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;



import java.util.TreeSet;



//import javax.persistence.EntityManager;
import javax.servlet.ServletContext;

import org.apache.commons.codec.binary.Base64;
//import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
//import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.chaitu.constants.GetPath;
import com.chaitu.model.CityLatLon;
import com.chaitu.model.DataTable;
//import com.chaitu.model.DataTable;
import com.chaitu.model.RadarSearchRespose;
import com.chaitu.service.DbServiceDao;
//import com.chaitu.service.DbServiceDao;
import com.chaitu.utils.JsonFileHandler;
import com.fasterxml.jackson.databind.ObjectMapper;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

@RequestMapping("/")
@Controller
public class CityOmniController {
    Map < String, Object > map = new HashMap < String, Object > ();
    @Autowired
    ServletContext servletContext;
    
    @Autowired
    RestTemplate restTemplate;
    
    @Autowired
    JsonFileHandler jsonFileHandler;
    
    @Autowired
    GetPath gpath;
    ///rest/get/getCat/{city}}
    @GetMapping("/rest/get/getCat/{city}")
    public ResponseEntity < Map < String, Integer >> getCategories(@PathVariable String city) throws Exception {
        System.out.println("CityOmniController : /rest/get/getCat/" + city);
        JSONParser parser = new JSONParser();
        String sourceLocation = gpath.getPath().replace('\\', '/');
        Map < String, Integer > m = new HashMap < String, Integer > ();
        if (city != null) {
       		//System.out.println(sourceLocation + city.toLowerCase() + "/");
            File file = new File(sourceLocation + city.toLowerCase() + "/");
            File[] files = file.listFiles();
            if (files != null) {
                if (files.length != 0) {
                    for (File f: files) {
                        String filePath = sourceLocation + city.toLowerCase() + "/" + f.getName();
                        
                        Object obj = parser.parse(new FileReader(filePath));
                        JSONObject jsonObject = (JSONObject) obj;
                        JSONArray msg = (JSONArray) jsonObject.get(f.getName().substring(0, f.getName().indexOf("."))); //fileName
                        if (msg != null) {
                            m.put(f.getName().substring(0, f.getName().indexOf(".")), msg.size());
                        }
                    }
                    return new ResponseEntity < Map < String, Integer >> (m, HttpStatus.OK);
                } else {
                    return new ResponseEntity < Map < String, Integer >> (HttpStatus.NO_CONTENT);
                }
            } else {
                return new ResponseEntity < Map < String, Integer >> (HttpStatus.NO_CONTENT);
            }
        } else {
            return new ResponseEntity < Map < String, Integer >> (HttpStatus.BAD_GATEWAY);
        }
    }

    ///rest/searchPage/{city}/{category}/{keyword}
    @SuppressWarnings("unchecked")
    @GetMapping("/rest/searchPage/{city}/{category}/{keyword}")
    public ResponseEntity < ? > searchByKeyword(@PathVariable String city, @PathVariable String category, @PathVariable String keyword) throws Exception {
        System.out.println("CityOmniController : /rest/searchPage/" + city + "/" + category + "/" + keyword);
        JSONParser parser = new JSONParser();
        JSONArray ja = new JSONArray();
        String sourceLocation = gpath.getPath().replace('\\', '/');
        try {
            String[] searchKeyWords = keyword.split("\\+");
            File file0 = new File(sourceLocation);
            File[] files0 = file0.listFiles();
            if (!city.equalsIgnoreCase("all")) {
                for (File f: files0) {
                    String str = null;
                    if (city.equalsIgnoreCase(f.getName())) {
                        //tirupati, C:/Users/KRISHNA/Desktop/data/json/tirupati, search Word;
                        str = readDataByLocation(f.getName().trim(), sourceLocation + f.getName().trim() + "/", category.trim(), searchKeyWords);
                        Object obj = parser.parse(str);
                        JSONObject jsonObject = (JSONObject) obj;
                        ja.add(jsonObject);
                        break;
                    }

                }
            } else if (city.equalsIgnoreCase("all")) {
                for (File f: files0) {
                    String str = null;
                    //all, C:/Users/KRISHNA/Desktop/data/json/tirupati, search Word;
                    str = readDataByLocation(f.getName().trim(), sourceLocation + f.getName().trim() + "/", category.trim(), searchKeyWords);
                    Object obj = parser.parse(str);
                    JSONObject jsonObject = (JSONObject) obj;
                    ja.add(jsonObject);
                }
            }
        } catch (Exception e) {
            System.out.println("searchByKeyword : " + e);
        }
        return new ResponseEntity < Object > ("{\"data\":" + ja + "}", HttpStatus.OK);
    }

    @SuppressWarnings("unchecked")
    public static String readDataByLocation(String city, String location, String category, String[] searchKeyWords) throws Exception {
        System.out.println("CityOmniController : readDataByLocation " + city + " , " + location + ", " + category + "/" + searchKeyWords.length);
        String str = null;
        JSONParser parser = new JSONParser();
        JSONArray ja = new JSONArray();
        JSONObject jsonObject = null;
        JSONArray msg = null;
        try {
            File file = new File(location);
            File[] files = file.listFiles();
            if (category.equalsIgnoreCase("all")) {
                for (File f: files) {
                    //banks, C:/Users/KRISHNA/Desktop/data/json/tirupati/banks.json, search Word;		        	
                    str = readDataFromFiles(f.getName().substring(0, f.getName().indexOf(".")), location + f.getName(), searchKeyWords);
                    Object obj = parser.parse(str);
                    jsonObject = (JSONObject) obj;
                    msg = (JSONArray) jsonObject.get(f.getName().substring(0, f.getName().indexOf(".")));
                    if (msg.size() >= 1)
                        ja.add(jsonObject);
                }
            } else if (!category.equalsIgnoreCase("all")) {
                for (File f: files) {
                    if (f.getName().substring(0, f.getName().indexOf(".")).equalsIgnoreCase(category)) {
                        str = readDataFromFiles(f.getName().substring(0, f.getName().indexOf(".")), location + f.getName(), searchKeyWords);
                        //System.out.println(str);
                        Object obj = parser.parse(str);
                        jsonObject = (JSONObject) obj;
                        msg = (JSONArray) jsonObject.get(f.getName().substring(0, f.getName().indexOf(".")));
                        if (msg.size() >= 1) {
                            ja.add(jsonObject);
                        }
                        break;
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("readDataByLocation : " + e);
        }
        return "{\"" + city.toLowerCase() + "\":" + ja + "}";
    }

    @SuppressWarnings("unchecked")
    public static String readDataFromFiles(String fileName, String filePath, String[] searchKeyWords) {
        System.out.println("CityOmniController : readDataFromFiles " + fileName + " , " + filePath + ", " + searchKeyWords.length);
        JSONParser parser = new JSONParser();
        JSONArray ja = new JSONArray();
        try {
            Object obj = parser.parse(new FileReader(filePath));
            JSONObject jsonObject = (JSONObject) obj;
            JSONArray msg = (JSONArray) jsonObject.get(fileName); //fileName
            if (msg != null) {
                Iterator < ? > iterator = msg.iterator();
                while (iterator.hasNext()) {
                    String temp = iterator.next().toString();
                    Object obj1 = parser.parse(temp);
                    JSONObject jsonObject1 = (JSONObject) obj1;
                    String searchWord = searchKeyWords[0].trim().toLowerCase();
                    if (searchWord.equalsIgnoreCase("qwertyqwerty")) {
                        ja.add(jsonObject1);
                    } else if ((jsonObject1.get("name").toString().toLowerCase().indexOf(searchWord) != -1)) {                    	
                    	if(searchKeyWords.length > 1){
							if (jsonObject1.get("name").toString().toLowerCase().indexOf(searchKeyWords[0].trim().toLowerCase()) != -1 
									&& (jsonObject1.get("name").toString().toLowerCase().indexOf(searchKeyWords[1].trim().toLowerCase()) != -1)) {
								ja.add(jsonObject1); 
							}									
						}else{
	                        ja.add(jsonObject1); 
						}  
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("readDataFromFiles : " + e);
        }
        //System.out.println("{\""+fileName+"\":"+ja+"}");
        return "{\"" + fileName + "\":" + ja + "}";
    }

    ///rest/readDataByCategory/city/category categories
    @GetMapping("/rest/getDataByCategory/{city}/{category}/{clattitude0}/{clongitude0}/get")
    public ResponseEntity < ? > readDataByCategoryRest(@PathVariable String city, @PathVariable String category, @PathVariable String clattitude0, @PathVariable String clongitude0) throws Exception {
        System.out.println("CityOmniController : /rest/getDataByCategory/" + city + "/" + category + "/" + clattitude0 + "/" + clongitude0);
        double clattitude = 0;
        double clongitude = 0;
        if (!clattitude0.equalsIgnoreCase("NA") && !clongitude0.equalsIgnoreCase("NA")) {
            clattitude = Double.parseDouble(clattitude0);
            clongitude = Double.parseDouble(clongitude0);
        }
        Object obj = null;
        if (city != null && category != null) {
            if (map.containsKey(city + "_" + category)) {
                obj = map.get(city + "_" + category);
            } else {
            	String sourceLocation = gpath.getPath().replace('\\', '/');
                obj = readDataByCategory(sourceLocation + city.toLowerCase() + "/" + category + ".json", category);
                map.put(city + "_" + category, obj);
            }
            if (obj != null) {
                if (clattitude != 0 && clongitude != 0)
                    obj = sortByLanLon(obj, clattitude, clongitude);
                return new ResponseEntity < Object > (obj, HttpStatus.OK);
            } else {
                return new ResponseEntity < Object > ("NO CONTENT", HttpStatus.NO_CONTENT);
            }
        } else {
            return new ResponseEntity < Object > ("city : " + city.toLowerCase() + ", \n category : " + category, HttpStatus.BAD_REQUEST);
        }
    }

    @SuppressWarnings("unchecked")
    private Object sortByLanLon(Object obj, Double clattitude, Double clongitude) throws ParseException {
        System.out.println("CityOmniController : sortByLanLon ,  clattitude : " + clattitude + " , clongitude : " + clongitude);
        List < Double > li = null;
        List < JSONObject > li1 = null;
        JSONParser parser = new JSONParser();
        Map < Double, JSONObject > mm = new HashMap < Double, JSONObject > ();
        Object obj1 = null;
        String latitude = "", longitude = "";
        double distance = 0;
        JSONArray msg1 = (JSONArray) obj;
        for (int i = 0; i < msg1.size() - 1; i++) {
            JSONObject msg = (JSONObject) msg1.get(i);
            Set < ? > keys = msg.keySet();
            Iterator < ? > itr = keys.iterator();
            while (itr.hasNext()) {
                String key = (String) itr.next();
                if (key.equalsIgnoreCase("longitude")) {
                    latitude = (String) msg.get(key);
                }
                if (key.equalsIgnoreCase("latitude")) {
                    longitude = (String) msg.get(key);
                }
            }
            //System.out.println(Double.parseDouble(clattitude)+", "+Double.parseDouble(clongitude)+", "+ Double.parseDouble(latitude)+", "+ Double.parseDouble(longitude));
            distance = distance(clattitude, clongitude, Double.parseDouble(latitude), Double.parseDouble(longitude));
            mm.put(distance, msg);
        }
        li = new ArrayList < Double > ();
        li1 = new ArrayList < JSONObject > ();
        li.addAll(mm.keySet());
        Collections.sort(li);
        Iterator < Double > it = li.iterator();
        while (it.hasNext()) {
            Double double1 = (Double) it.next();
            JSONObject oo = mm.get(double1);
            oo.put("distance", "" + double1);
            li1.add(oo);
        }
        obj1 = parser.parse(li1.toString());
        return obj1;
    }

    private double distance(double lat1, double lon1, double lat2, double lon2) {
        char unit = 'K';
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
        if (unit == 'K') {
            dist = dist * 1.609344;
        } else if (unit == 'N') {
            dist = dist * 0.8684;
        }
        return (dist);
    }

    private double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }

    private double rad2deg(double rad) {
        return (rad * 180.0 / Math.PI);
    }

    private static Object readDataByCategory(String filePath, String category) {
        System.out.println("CityOmniController : readDataByCategory : filePath: " + filePath + " , category :" + category);
        JSONParser parser = new JSONParser();
        Object obj = null;
        try {
            obj = parser.parse(new FileReader(filePath));
            JSONObject jsonObject = (JSONObject) obj;
            JSONArray msg = (JSONArray) jsonObject.get(category); //fileName
            if (msg != null) {
                List < Object > li = new ArrayList < Object > ();
                for (int i = 0; i <= msg.size() - 1; i++) {
                    li.add(msg.get(i));
                }
                obj = parser.parse(li.toString());
            }
        } catch (Exception e) {
            System.out.println("readDataByCategory : " + e);
        }
        return obj;
    }

/*--------------------------------------------------------------------------------------------*/
    
	@PostMapping("/rest/write/createDataFile/{city}/{category}")
    public void createDataFile(@PathVariable String city, @PathVariable String category, @RequestBody JSONObject data) throws Exception {

		String desLoc = "C:/Users/KRISHNA/Desktop/new/";
		createJsonFile(city, category+".json", data.toString(), desLoc);
		
    }

    public static void createJsonFile(String city, String fileName, String data, String destinationLocation) throws IOException{
		FileOutputStream fop = null;
		File file;
		
		try {
			//System.out.println(city+"   ---   "+fileName+"   ---   "+destinationLocation);
			String loc = destinationLocation+city;
			loc = loc.replace("/", "\\");
			
			
			File dir = new File(loc+"\\");
	        if (!dir.exists()) {
	            if (dir.mkdir()) {
	                System.out.println(dir.getName()+" : Directory is created!");
	            } else {
	                System.out.println("Failed to create directory!");
	            }
	        }

	        //System.out.println(loc+"\\"+fileName);
			/*file = new File(destinationLocation+city);
			System.out.println(file.mkdir());*/
			
			file = new File(loc+"\\"+fileName);
			fop = new FileOutputStream(file);

			// if file doesnt exists, then create it
			if (!file.exists()) {
				file.createNewFile();
			}

			// get the content in bytes
			byte[] contentInBytes = data.getBytes();

			fop.write(contentInBytes);
			fop.flush();
			
			System.out.println(city+"/"+file.getName()+"  created.");
			

		}catch(Exception e){System.out.println("createJsonFile(): ");
				e.printStackTrace();
		} finally {
			fop.close();
		}
	}
    
    @CrossOrigin(origins = "*")
    @RequestMapping(path = "/geocode", method = RequestMethod.GET )
    public Response getGeocode(@RequestParam String address) throws IOException {
        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder()
        		.url("https://trueway-places.p.rapidapi.com/FindPlacesNearby?type=cafe&radius=150&language=en&location=37.783366%252C-122.402325")
        		.get()
        		.addHeader("x-rapidapi-host", "trueway-places.p.rapidapi.com")
        		.addHeader("x-rapidapi-key", "17defe8344msh14c09b6da4a1a4bp12b5fcjsn7b9aa98b0e06")
        		.build();
        Response responseBody = client.newCall(request).execute();
        System.out.println("--responseBody.string()---:: "+responseBody.exchange());
        return responseBody;
    }
    
    //static ResponseEntity<Map> response = null;
    @CrossOrigin(origins = "*")
    ///"/rest/get/search/{lat}/{lon}/{cat}/{text}"
    @GetMapping("/rest/get/search/{city}/{clat}/{clon}/{lat}/{lon}/{radius}/{category}/{keyword}")
    public ResponseEntity<Map> searchGoogleApi(@PathVariable String city, @PathVariable String lat, @PathVariable String lon, 
					    			@PathVariable String clat, @PathVariable String clon, @PathVariable String radius, 
					    			@PathVariable String category, @PathVariable String keyword) throws Exception {
    	
    	if (lat.equalsIgnoreCase("00.00") || lon.equalsIgnoreCase("00.00") || lat.equalsIgnoreCase("undefined") || lon.equalsIgnoreCase("undefined")) {
    		CityLatLon cll = getlatlonBycity(city);
    		if (cll != null) {
    			lat = cll.lat;
        		lon = cll.lon;
			}	 
		}
    	String uri = "";
    	
    	if (category.equalsIgnoreCase("all")) {
    		uri = "https://trueway-places.p.rapidapi.com/FindPlacesNearby?type="+category+"&radius=500000&language=en&location="+lat+","+lon;
	    	//uri = "https://maps.googleapis.com/maps/api/place/radarsearch/json?location="+lat+","+lon+"&rankby=distance&radius="+radius+"&keyword="+keyword+"&key=AIzaSyCQ0FD8o_1KjowT5c_c0qY6cQhvGiNwWPg";
		}else{
	    	if (keyword.equalsIgnoreCase("all")) {
	    		keyword = "";
			}
	    	uri = "https://trueway-places.p.rapidapi.com/FindPlacesNearby?type="+category+"&radius=500000&language=en&location="+lat+","+lon;
	    	//uri = "https://maps.googleapis.com/maps/api/place/radarsearch/json?location="+lat+","+lon+"&rankby=distance&radius="+radius+"&type="+category+"&keyword="+keyword+"&key=AIzaSyCQ0FD8o_1KjowT5c_c0qY6cQhvGiNwWPg";
		}
    	System.out.println("trueway-places.p.rapidapi.com :: "+uri);

    	final  HttpHeaders headers = new HttpHeaders();
    	headers.set("x-rapidapi-key", "17defe8344msh14c09b6da4a1a4bp12b5fcjsn7b9aa98b0e06");
    	
    	final HttpEntity<String> entity = new HttpEntity<String>(headers);
    	 
    	/*if(response != null) {
    		return new ResponseEntity <Map> (response.getBody(), HttpStatus.OK);
    	}else {*/
	    	ResponseEntity<Map> response = restTemplate.exchange(uri, HttpMethod.GET, entity, Map.class);        
	        System.out.println(response.getBody());
    	//}
    	return new ResponseEntity <Map> (response.getBody(), HttpStatus.OK);
    }
    public HttpHeaders createHeaders(String username, String password){
    	   return new HttpHeaders() {{
    	         String auth = username + ":" + password;
    	         byte[] encodedAuth = Base64.encodeBase64( 
    	            auth.getBytes(Charset.forName("US-ASCII")) );
    	         String authHeader = "Basic " + new String( encodedAuth );
    	         set( "Authorization", authHeader );
    	      }};
    	}
    
    ///"/rest/get/search/getDetailsByPlaceId/{place_id}"
    @GetMapping("/rest/get/search/getDetailsByPlaceId/{place_id}")
    public ResponseEntity<Object> getDetailsByPlaceId(@PathVariable String place_id) throws Exception {
    	String uri = "https://maps.googleapis.com/maps/api/place/details/json?placeid="+place_id+"&key=AIzaSyCQ0FD8o_1KjowT5c_c0qY6cQhvGiNwWPg";
    	System.out.println("getDetailsByPlaceId : "+uri);
    	Map<?, ?> result = restTemplate.getForObject(uri, Map.class);
    	//System.out.println(result.get("result"));
    	return new ResponseEntity <Object> (result.get("result"), HttpStatus.OK);
	}

	List<RadarSearchRespose> al = null;
    public List<RadarSearchRespose> sortRadarSearchData(Map<?, ?> map, Double clat, Double clon) throws Exception{    	
    	al = new ArrayList<RadarSearchRespose>();
    	List<?> f = (List<?>) map.get("results");
    	Iterator<?> itr = f.iterator();
    	while (itr.hasNext()) {
    		ObjectMapper mapperObj = new ObjectMapper();
        	String h = mapperObj.writeValueAsString(itr.next());
        	org.json.JSONObject jsonObj = new org.json.JSONObject(h);
        	org.json.JSONObject k = (org.json.JSONObject) jsonObj.get("geometry");
        	org.json.JSONObject l = (org.json.JSONObject) k.get("location");
        	
        	Double lat = (Double) l.get("lat");
        	Double lon = (Double) l.get("lng");
        	al.add(new RadarSearchRespose(jsonObj.get("place_id").toString(), distance(lat, lon, clat, clon)));
			
		}     	
    	Collections.sort(al, new Comparator<RadarSearchRespose>(){
			public int compare(RadarSearchRespose s1, RadarSearchRespose s2) {
				if(s1.distance==s2.distance)  
					return 0;  
				else if(s1.distance>s2.distance)  
					return 1;  
				else  
					return -1;  
			}  
		});
    	
    	return al;
    }    
    
    @Autowired
    DbServiceDao userServiceDao;
    
    @CrossOrigin(origins = "*")
    @PostMapping("/rest/add/confession")
    public ResponseEntity<Object> addConfession(@RequestBody DataTable data) throws Exception {
    	HttpHeaders response = new HttpHeaders();
	    response.set("Access-Control-Allow-Origin", "*");
	    data.setDate(new Date());
	    userServiceDao.addConfession(data);
	    return new ResponseEntity<Object>(data, response, HttpStatus.OK);
    }
    @CrossOrigin(origins = "*")
    @PostMapping("/rest/readall/confession")
    public ResponseEntity<Object> readAllConfession() throws Exception {
    	HttpHeaders response = new HttpHeaders();
	    response.set("Access-Control-Allow-Origin", "*");
	    return new ResponseEntity<Object>(userServiceDao.readAllConfession(), response, HttpStatus.OK);
    }
    
    @CrossOrigin(origins = "*")
    @PostMapping("/rest/readConfessionByArea/confession/{area}")
    public ResponseEntity<Object> readConfessionByArea(@PathVariable String area) throws Exception {
    	HttpHeaders response = new HttpHeaders();
	    response.set("Access-Control-Allow-Origin", "*");
	    return new ResponseEntity<Object>(userServiceDao.readConfessionByArea(area), response, HttpStatus.OK);
    }
    
//    @CrossOrigin(origins = "*")
    @GetMapping("/rest/get/latlon/{state}/cities")
    public ResponseEntity<Object> readCitiesFromFile(@PathVariable String state) throws Exception {
    	String sourceLocation = gpath.getPath().replace('\\', '/');
		JSONParser parser = new JSONParser();
		List < Object > li = new ArrayList < Object > ();
		JSONObject obj = null;
		try {     
        	obj = (JSONObject) parser.parse(new FileReader(sourceLocation+"citiesInIndia.json"));
            JSONObject jsonObject = (JSONObject) obj;
            JSONArray msg = (JSONArray) jsonObject.get("statelist");
            if (msg != null) {
                for (int i = 0; i <= msg.size() - 1; i++) {
                	JSONObject ob = (JSONObject) msg.get(i);
                	state=state.replaceAll("_", " ");
                	if (ob.get("state").toString().equalsIgnoreCase(state)) {
                		li.add(ob.get("city_name").toString());
                	}
                }
            }
		} catch (Exception e) {
        	System.out.println("readCitiesFromFile() : "+e);
        }
		return new ResponseEntity < Object > (li, HttpStatus.OK);
    }
    
    static Map<String, CityLatLon> statesMap = new HashMap<String , CityLatLon>();
    public CityLatLon getlatlonBycity(String city){
    	if (statesMap.containsKey(city)) {
    		System.out.println(statesMap.get(city)+"from map--------------------"+city);
			return (CityLatLon) statesMap.get(city);
		}else{
			System.out.println(statesMap+"from file--------------------"+city);
	    	String sourceLocation = gpath.getPath().replace('\\', '/');
			JSONParser parser = new JSONParser();
			JSONObject obj = null;
			
			try {     
	        	obj = (JSONObject) parser.parse(new FileReader(sourceLocation+"citiesInIndia.json"));
	            JSONObject jsonObject = (JSONObject) obj;
	            JSONArray msg = (JSONArray) jsonObject.get("statelist");
	            if (msg != null) {
	                for (int i = 0; i <= msg.size() - 1; i++) {
	                	JSONObject ob = (JSONObject) msg.get(i);
	                	city=city.replaceAll("_", " ");
	                	CityLatLon cll = new CityLatLon();
	                	String city1 = (String)ob.get("city_name");
	                	cll.city = city1.toLowerCase();
                		String lat = (String)ob.get("latitude");
                		String lon = (String)ob.get("longitude");
                		if (!lat.isEmpty() && !lon.isEmpty()) {
                			lat = lat.substring(0, lat.indexOf(" "));
                			lon = lon.substring(0, lon.indexOf(" "));
						}
                		cll.lat=lat;
                		cll.lon=lon;
	                	statesMap.put(cll.city, cll);
	                }
	            }
			} catch (Exception e) {
	        	System.out.println("readCitiesFromFile() : "+e);
	        }
			return (CityLatLon) statesMap.get(city);
		} 
    }
}
