package com.sponser;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.ProjectLogic;

@Controller
@RequestMapping("/Sponser/*")
public class SponserController {
	private static final Logger logger = LoggerFactory.getLogger(SponserController.class);
	@Autowired
	SponserLogic sponserLogic = null;


}
