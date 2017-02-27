package com.mkyong;

import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.Person;

@Controller
public class WelcomeController {

	// inject via application.properties
	@Value("${welcome.message:test}")
	private String message = "Hello World";

	@RequestMapping("/")
	public String welcome(Map<String, Object> model) {
		model.put("message", this.message);
		return "welcome";
	}
	
	@RequestMapping("/person")
	public String person(Map<String, Object> model) 
	{
		model.put("person","From Controller Person");
		return "person";
	}
	
	@RequestMapping("/index")
	public String index(Map<String, Object> model) 
	{
		model.put("person","From Controller Person");
		return "index";
	}
	@RequestMapping(value = "/PostService", method = RequestMethod.POST)
	public @ResponseBody String PostService(@RequestBody Person person) {
		
		StringBuilder reponseData = new StringBuilder();
		reponseData.append("Name: "+person.getName()+" ");
		reponseData.append("Location: "+person.getLocation()+" ");
		reponseData.append("Phone: "+person.getPhone());	
		return reponseData.toString();
	}

}