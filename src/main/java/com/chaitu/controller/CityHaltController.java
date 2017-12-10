package com.chaitu.controller;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.chaitu.constants.GetPath;

@RequestMapping("/")
@Controller
public class CityHaltController {

    Map < String, Object > map = new HashMap < String, Object > ();
    @Autowired
    ServletContext servletContext;
    
    @GetMapping("/")
    public ModelAndView openAll() {
        return new ModelAndView("index");
    }

    RestTemplate restTemplate = new RestTemplate();
    
   
    @GetMapping("/test")
    public Object test() {
	    final String uri = "http://cityhalt.com.preview.services/atms.json";
	    System.out.println(uri);
	    File file = new File("http://cityhalt.com.preview.services/atms.json");
	    System.out.println("file.getName() :"+file.length());
	    //HttpHeaders headers = new HttpHeaders();
	    //headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
	    //HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
	     
	    // ResponseEntity<String> result = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);
	    String result = restTemplate.getForObject(uri, String.class);
	     System.out.println("result :"+result);
	    return result;
    }
    
    
    @GetMapping("/viewAllServices")
    public ModelAndView viewAllServices() {
        return new ModelAndView("viewAllServices");
    }

    @GetMapping("/viewDetails")
    public ModelAndView viewDetails() {
        return new ModelAndView("viewDetails");
    }

    @GetMapping("/search")
    public ModelAndView openSearch() {
        return new ModelAndView("search");
    }
    
    @GetMapping("/aboutUS")
    public ModelAndView openabout() {
        return new ModelAndView("aboutUS");
    }
    
    @GetMapping("/metroCities")
    public ModelAndView metroCities() {
        return new ModelAndView("metroCities");
    }
    
    @Autowired
    GetPath gpath;
    ///rest/get/getCat/{city}}
    @GetMapping("/rest/get/getCat/{city}")
    public ResponseEntity < Map < String, Integer >> getCategories(@PathVariable String city) throws Exception {
        System.out.println("CityHaltController : /rest/get/getCat/" + city);
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
        System.out.println("CityHaltController : /rest/searchPage/" + city + "/" + category + "/" + keyword);
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
        System.out.println("CityHaltController : readDataByLocation " + city + " , " + location + ", " + category + "/" + searchKeyWords.length);
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
        System.out.println("CityHaltController : readDataFromFiles " + fileName + " , " + filePath + ", " + searchKeyWords.length);
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
        System.out.println("CityHaltController : /rest/getDataByCategory/" + city + "/" + category + "/" + clattitude0 + "/" + clongitude0);
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
        System.out.println("CityHaltController : sortByLanLon ,  clattitude : " + clattitude + " , clongitude : " + clongitude);
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
        System.out.println("CityHaltController : readDataByCategory : filePath: " + filePath + " , category :" + category);
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

}