package com.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping(value="/FTBC.com")
	public String main() {
		return "forward:/FTBC_MainView/FTBC_Main.jsp";
	}
}
