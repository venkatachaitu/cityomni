package com.chaitu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.chaitu.model.UserLogin;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@Autowired
    RestTemplate restTemplate;
	
	
	
}
