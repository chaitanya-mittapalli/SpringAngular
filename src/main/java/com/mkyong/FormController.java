package com.mkyong;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.dao.Person;

@Controller
public class FormController 
{
	@RequestMapping(value = "/form", method = RequestMethod.GET)
    public String form(Map<String, Object> model) 
	{
		return "angularform";
	}
	@RequestMapping(value = "/jsonform", method = RequestMethod.GET)
    public String JSONform(Map<String, Object> model) 
	{
		return "JSONFormSubmit";
	}
	@RequestMapping(value = "/PostFormData", method = RequestMethod.POST)
	public @ResponseBody Person PostService(@RequestBody Person person) 
	{	
		return person;
	}
	
	@RequestMapping(value = "/PostFormDataJSONArray", method = RequestMethod.POST)
	public @ResponseBody List<Person> PostFormDataJSONArray(@RequestBody List<Person> person) {	
		return person;
	}
	
	@RequestMapping(value = "/angularcopy", method = RequestMethod.GET)
    public String angularCopy(Map<String, Object> model) 
	{
		return "angularcopy";
	}
	
}
