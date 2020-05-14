package com.chaitu.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import com.chaitu.model.*;
import com.chaitu.service.DbServiceDao;
import com.mysql.fabric.xmlrpc.base.Data;

@RequestMapping("/")
@Controller
public class PageController {

	@Autowired
	RestTemplate restTemplate;

	@Autowired
	DbServiceDao userServiceDao;

	@GetMapping("/")
	public ModelAndView openAll() {
		return new ModelAndView("index");
	}

	@GetMapping("/login")
	public ModelAndView loginRegisterPage() {
		return new ModelAndView("/login");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView registerUser(UserLogin user) {
		user.setRegistrationDate(new Date().toString());
		user.setActiveStatus("true");
		boolean registerUser = userServiceDao.registerUser(user);
		ModelAndView modelAndView = new ModelAndView("login");
		modelAndView.addObject("registerstatus", registerUser);
		return modelAndView;
	}
	@Autowired
	HttpServletResponse res;
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginUser(UserLogin user) {
		UserLogin registerUser = userServiceDao.loginUser(user);
		ModelAndView modelAndView;
		if (registerUser != null) {
			modelAndView = new ModelAndView("timeline");
			modelAndView.addObject("userLogin", registerUser);
			String lastLoginTime = lastLoginTimeUpdate(user.getUserName(), new Date().toString());
			modelAndView.addObject("lastLoginTime", "Last Login: "+lastLoginTime);
			res.addCookie(new Cookie("username", registerUser.getUserName()));
		} else {
			modelAndView = new ModelAndView("login");
			modelAndView.addObject("loginStatus", "Invalid UserName/Password...!");
		}
		return modelAndView;
	}

	private String lastLoginTimeUpdate(String userName, String string) {
		return userServiceDao.lastLoginTimeUpdate(userName, string);
	}

	@GetMapping("/timeline")
	public ModelAndView openIimeline() {
		return new ModelAndView("timeline");
	}
	
	@GetMapping("/myFriends")
	public ModelAndView openmyFriends() {
		return new ModelAndView("myFriends");
	}
	
	@GetMapping("/logout")
	public ModelAndView userLogout() {
		res.addCookie(new Cookie("username", ""));
		return new ModelAndView("login");
	}
	
	/*
	 * @GetMapping("/updateProfile") public ModelAndView myProfileEmpty(@CookieValue
	 * (value = "username", defaultValue = "") String userName) {
	 * System.out.println("---------------------"+userName); UserLogin user =
	 * userServiceDao.getUser(userName); ModelAndView modelAndView = new
	 * ModelAndView("myProfile"); modelAndView.addObject("user", user); return
	 * modelAndView; }
	 */
	
	@GetMapping("/myProfile")
	public ModelAndView myProfile() {
		return new ModelAndView("myProfile");
	}
	
	@CrossOrigin(origins = "*")
	@GetMapping("/user/get/myProfile")
	public ResponseEntity<Object> myProfile(@RequestParam String userName) {
		UserLogin user = userServiceDao.getUser(userName);
		user.setPassword("");
		HttpHeaders response = new HttpHeaders();
	    response.set("Access-Control-Allow-Origin", "*");
	    return new ResponseEntity<Object>(user, response, HttpStatus.OK);
	}
	
	@CrossOrigin(origins = "*")
    @PostMapping("/user/post/updateProfile")
	public ResponseEntity<Object> updateMyProfile(@RequestBody UserLogin user) {
		UserLogin updateUser = userServiceDao.updateUser(user);
		HttpHeaders response = new HttpHeaders();
	    response.set("Access-Control-Allow-Origin", "*");
	    return new ResponseEntity<Object>(updateUser, response, HttpStatus.OK);
	}
	
	@CrossOrigin(origins = "*")
    @PostMapping("/user/timeline/addPost")
	public ResponseEntity<Object> addUserPost(@RequestBody UserPosts post) {
		UserPosts updateUser = userServiceDao.addUserPost(post);
		HttpHeaders response = new HttpHeaders();
	    response.set("Access-Control-Allow-Origin", "*");
	    return new ResponseEntity<Object>(updateUser, response, HttpStatus.OK);
	}
	
	@CrossOrigin(origins = "*")
    @GetMapping("/user/timeline/deletePost")
	public ResponseEntity<Object> deletePost(@RequestParam(name="postId") String postId) {
		userServiceDao.deletePost(postId);
		HttpHeaders response = new HttpHeaders();
	    response.set("Access-Control-Allow-Origin", "*");
	    return new ResponseEntity<Object>(new UserPosts(), response, HttpStatus.OK);
	}
	
	@CrossOrigin(origins = "*")
	@GetMapping("/user/timeline/getPosts")
	public ResponseEntity<Object> readAllPosts(@RequestParam String user) {
		HttpHeaders response = new HttpHeaders();
	    response.set("Access-Control-Allow-Origin", "*");
	    return new ResponseEntity<Object>(userServiceDao.readAllPosts(user), response, HttpStatus.OK);
	}
	
	@CrossOrigin(origins = "*")
	@GetMapping("/user/timeline/likeUser")
	public ResponseEntity<Object> likeUser(@RequestParam(name = "postId") String postId, @RequestParam(name = "userName") String userName) {
		HttpHeaders response = new HttpHeaders();
	    response.set("Access-Control-Allow-Origin", "*");
	    userServiceDao.likeUser(postId, userName);
	    return new ResponseEntity<Object>(new UserPosts(), response, HttpStatus.OK);
	}
	
	@CrossOrigin(origins = "*")
	@GetMapping("/user/timeline/updatePrivacy")
	public ResponseEntity<Object> updatePrivacy(@RequestParam(name = "postId") String postId, @RequestParam(name = "userName") String userName, @RequestParam(name = "privacy") String privacy) {
		userServiceDao.updatePrivacy(postId,userName,privacy);
		HttpHeaders response = new HttpHeaders();
	    response.set("Access-Control-Allow-Origin", "*");
	    return new ResponseEntity<Object>(new UserPosts(), response, HttpStatus.OK);
	}
	
	@CrossOrigin(origins = "*")
	@GetMapping("/user/myFriends/findFriends")
	public ResponseEntity<Object> findFriends(@RequestParam(name="value") String value) {
		List <String> users = userServiceDao.findFriends(value);
		HttpHeaders response = new HttpHeaders();
	    response.set("Access-Control-Allow-Origin", "*");
	    return new ResponseEntity<Object>(users, response, HttpStatus.OK);
	}
	
	@CrossOrigin(origins = "*")
	@GetMapping("/user/myFriends/viewSearchProfile")
	public ResponseEntity<Object> viewSearchProfile(@RequestParam String userName) {
		UserLogin userLogin = userServiceDao.viewSearchProfile(userName);
		if(userLogin != null) {
			String privateFields = userLogin.getPrivateFields();
			if(privateFields != null) {
				if(privateFields.contains("mobileNo"))
					userLogin.setMobileNo("");
				if(privateFields.contains("email"))
					userLogin.setEmail("");
				if(privateFields.contains("gender"))
					userLogin.setGender("");
				if(privateFields.contains("dob"))
					userLogin.setDob("");
				if(privateFields.contains("city"))
					userLogin.setCity("");
				if(privateFields.contains("country"))
					userLogin.setCountry("");
				if(privateFields.contains("pin"))
					userLogin.setPin("");
			}
			userLogin.setPassword("");
			userLogin.setPrivateFields("");
			userLogin.setLastLogin("");
			userLogin.setActiveStatus("");
		}
		HttpHeaders response = new HttpHeaders();
	    response.set("Access-Control-Allow-Origin", "*");
	    return new ResponseEntity<Object>(userLogin, response, HttpStatus.OK);
	}
	
	@GetMapping("/rest/get/getaddress")
	public Object getAddressByIP() {
		Object result = restTemplate.getForObject(
				"https://api.ipdata.co/?api-key=d0e8408a008f8466593c9914927ce6659fccffcdf7b06942fd400251",
				Object.class);
		return new ResponseEntity<Object>(result, HttpStatus.OK);
	}

	@GetMapping("/services")
	public ModelAndView services() {
		return new ModelAndView("services");
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

	@GetMapping("/contact")
	public ModelAndView openContact() {
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

	@GetMapping("/plans")
	public ModelAndView createPlan() {
		return new ModelAndView("createPlan");
	}

	@GetMapping("/test")
	public Object test() {
		/*
		 * final String uri = "http://cityomni.com.preview.services/atms.json";
		 * System.out.println(uri); File file = new
		 * File("http://cityomni.com.preview.services/atms.json");
		 * System.out.println("file.getName() :"+file.length());
		 */
		// HttpHeaders headers = new HttpHeaders();
		// headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		// HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);

		// ResponseEntity<String> result = restTemplate.exchange(uri, HttpMethod.GET,
		// entity, String.class);
		/*
		 * Object result = restTemplate.getForObject("http://freegeoip.net/json/",
		 * Object.class); System.out.println("result :"+result); return new
		 * ResponseEntity<Object>(result, HttpStatus.OK);
		 */
		return null;
	}

	@GetMapping(value = "/excelImport")
	public ModelAndView getIndexPage() {
		return new ModelAndView("excelImport");
	}

	@GetMapping(value = "/importPreview")
	public String getImportView() {
		return "importPreview";
	}

	@PostMapping(value = "/import")
	public ModelAndView getExcelData(@RequestParam("filename") MultipartFile reapExcelDataFile) {
		String fileName = reapExcelDataFile.getOriginalFilename();
		List<ReportData2> cells = null;
		Map<String, SprintData> map = null;
		int open = 0;
		int inDev = 0;
		int qa = 0;
		int mr = 0;
		int totalPoints = 0;
		try {
			if (fileName == null || (!fileName.endsWith(".xls") && !fileName.endsWith(".xlsx"))) {
				ModelAndView modelAndView = new ModelAndView("importPreview");
				modelAndView.addObject("error", "File doesn't support...!");
				modelAndView.addObject("fileName", fileName);

				return modelAndView;
			}

			ReportData2 reportData2;
			XSSFWorkbook book = new XSSFWorkbook(reapExcelDataFile.getInputStream());
			XSSFSheet sheet = book.getSheetAt(0);
			cells = new ArrayList<ReportData2>();
			map = new HashMap<String, SprintData>();
			String st = "", startDate = "", endDate = "", sprintName = "";
			HashMap<Integer, String> headers = new HashMap<Integer, String>();
			int issueKey = 999999999, assignee = 999999999, points = 999999999, status = 999999999, sprint = 999999999;
			for (Row row : sheet) {
				if (row.getRowNum() == 0) {
					for (int i = 0; i < row.getLastCellNum(); i++) {
						Cell cell = row.getCell(i);
						if (cell.toString().equalsIgnoreCase("Issue key")) {
							issueKey = i;
						} else if (cell.toString().equalsIgnoreCase("Name")) {
							assignee = i;
						} else if (cell.toString().toLowerCase().contains("story points")) {
							points = i;
						} else if (cell.toString().equalsIgnoreCase("Status")) {
							status = i;
						} else if (cell.toString().equalsIgnoreCase("sprint")) {
							sprint = i;
						} else {
							continue;
						}
						if (issueKey != 999999999 && assignee != 999999999 && points != 999999999 && status != 999999999
								&& sprint != 999999999)
							headers.put(i, cell.toString());
					}
					continue;
				}
				if (headers.isEmpty()) {
					ModelAndView modelAndView = new ModelAndView("importPreview");
					modelAndView.addObject("error",
							" * Required Fields => Issue key, Name, Story Points, Status, Sprint.");
					modelAndView.addObject("fileName", fileName);
					return modelAndView;
				}
				reportData2 = new ReportData2();
				reportData2.setIssueKey(row.getCell(issueKey).toString());
				reportData2.setAssgnee(row.getCell(assignee).toString());
				if (!row.getCell(points).toString().isEmpty()) {
					int numericCellValue = (int) row.getCell(points).getNumericCellValue();
					reportData2.setPoints(numericCellValue);
				}
				reportData2.setStatus(row.getCell(status).toString());
				cells.add(reportData2);
				try {
					st = row.getCell(sprint).toString();
					if (st != null && !st.isEmpty()) {
						int c = st.indexOf('(');
						sprintName = st.substring(0, c);
						String sprintDate = st.substring(c, st.length()).trim();
						startDate = sprintDate.substring(1, sprintDate.indexOf('-')).trim();
						endDate = sprintDate.substring(sprintDate.indexOf('-') + 1, sprintDate.length() - 1).trim();
						map.put(sprintName, new SprintData(sprintName, startDate, endDate));
					}

				} catch (Exception e) {
					map.put(st, new SprintData(sprintName, "-", "-"));
				}

			}
			book.close();

			open = cells.stream().filter(e -> e.status.equalsIgnoreCase("open")).map(e -> e.status)
					.collect(Collectors.counting()).intValue();
			inDev = cells.stream()
					.filter(e -> e.status.equalsIgnoreCase("Ready For Dev")
							|| e.status.equalsIgnoreCase("In Development"))
					.map(e -> e.status).collect(Collectors.counting()).intValue();
			qa = cells.stream()
					.filter(e -> e.status.equalsIgnoreCase("In Test") || e.status.equalsIgnoreCase("Ready to Test"))
					.map(e -> e.status).collect(Collectors.counting()).intValue();
			mr = cells.stream().filter(e -> e.status.equalsIgnoreCase("Ready for Release")).map(e -> e.status)
					.collect(Collectors.counting()).intValue();

			totalPoints = cells.stream().mapToInt(e -> e.getPoints()).sum();

		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView modelAndView = new ModelAndView("importPreview");
			modelAndView.addObject("error", "Data mismatched / File doesn't support...!");
			modelAndView.addObject("fileName", fileName);

			return modelAndView;
		}

		ModelAndView modelAndView = new ModelAndView("importPreview");
		modelAndView.addObject("cells", cells);
		modelAndView.addObject("open", open);
		modelAndView.addObject("inDev", inDev);
		modelAndView.addObject("qa", qa);
		modelAndView.addObject("mr", mr);
		modelAndView.addObject("totalPoints", totalPoints);
		modelAndView.addObject("sprintDetails", map);
		modelAndView.addObject("fileName", fileName);
		return modelAndView;
	}
}
