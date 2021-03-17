package com.community;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/Community/*")
public class CommunityController {
	
	@Autowired
	CommunityLogic communityLogic = null;


}
