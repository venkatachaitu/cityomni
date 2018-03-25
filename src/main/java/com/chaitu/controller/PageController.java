package com.chaitu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/")
@Controller
public class PageController {
	
	@Autowired
    RestTemplate restTemplate;
	
	@GetMapping("/")
    public ModelAndView openAll() {
        return new ModelAndView("index");
    }
	
	@GetMapping("/rest/get/getaddress")
    public Object getAddressByIP() {
    	Object result = restTemplate.getForObject("http://freegeoip.net/json/", Object.class);
	    return new ResponseEntity<Object>(result, HttpStatus.OK);
    }
	
    @GetMapping("/services")
    public ModelAndView services() {
        return new ModelAndView("services");
    }

    @GetMapping("/viewList")
    public ModelAndView viewList() {
        return new ModelAndView("viewList");
    }
    
    @GetMapping("/view")
    public ModelAndView openView() {
        return new ModelAndView("view");
    }
    
    @GetMapping("/search")
    public ModelAndView openSearch() {
        return new ModelAndView("search");
    }
    
    @GetMapping("/searchview")
    public ModelAndView searchView() {
        return new ModelAndView("searchview");
    }
    
    @GetMapping("/about")
    public ModelAndView openabout() {
        return new ModelAndView("about");
    }
    
    @GetMapping("/states")
    public ModelAndView states() {
        return new ModelAndView("states");
    }
    
    @GetMapping("/cities")
    public ModelAndView cities() {
        return new ModelAndView("cities");
    }
    
    @GetMapping("/metroCities")
    public ModelAndView metroCities() {
        return new ModelAndView("metroCities");
    }
    
    @GetMapping("/confession")
    public ModelAndView confession() {
        return new ModelAndView("confession");
    }
    
    @GetMapping("/createPlan")
    public ModelAndView createPlan() {
        return new ModelAndView("createPlan");
    }
    
    @GetMapping("/test")
    public Object test() {
	    /*final String uri = "http://cityhalt.com.preview.services/atms.json";
	    System.out.println(uri);
	    File file = new File("http://cityhalt.com.preview.services/atms.json");
	    System.out.println("file.getName() :"+file.length());*/
	    //HttpHeaders headers = new HttpHeaders();
	    //headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
	    //HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
	     
	    // ResponseEntity<String> result = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);
	    /*Object result = restTemplate.getForObject("http://freegeoip.net/json/", Object.class);
	     System.out.println("result :"+result);
	    return new ResponseEntity<Object>(result, HttpStatus.OK);*/
	    return null;
    }
}
