package com.chaitu.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import com.chaitu.model.*;

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
    	Object result = restTemplate.getForObject("https://api.ipdata.co/?api-key=d0e8408a008f8466593c9914927ce6659fccffcdf7b06942fd400251", Object.class);
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
	    /*final String uri = "http://cityomni.com.preview.services/atms.json";
	    System.out.println(uri);
	    File file = new File("http://cityomni.com.preview.services/atms.json");
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
			 if(fileName== null || (!fileName.endsWith(".xls") && !fileName.endsWith(".xlsx"))) {
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
						}else{
							continue;
						}
						if(issueKey != 999999999 && assignee != 999999999 && points != 999999999 && status != 999999999 && sprint != 999999999)
							headers.put(i, cell.toString());
					}
					continue;
				}
				if(headers.isEmpty()) {
					ModelAndView modelAndView = new ModelAndView("importPreview");
					modelAndView.addObject("error", " * Required Fields => Issue key, Name, Story Points, Status, Sprint.");
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
