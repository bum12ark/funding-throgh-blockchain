package com.project;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vo.ProjectVO;

@RestController
@RequestMapping("/Project")
public class RestProjectController {
	private static final Logger logger = LoggerFactory.getLogger(RestProjectController.class);
	@Autowired
	ProjectLogic projectLogic = null;

	@PostMapping("createProject.ftbc")
	public String createProject(@RequestParam Map<String, Object> pMap) throws Exception {
		logger.info("###=======createProject 호출 성공");
		projectLogic.createProject(pMap);
		return "redirect:FTBC_myProjectList.jsp";
	}

	@PostMapping("/ManageProjects.ftbc")
	public @ResponseBody Object ManageProjects(@ModelAttribute("projectVO") ProjectVO pVO) {
		logger.info("ManageProjects");
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("data", projectLogic.ManageProjects(pVO));
		Object result = mp;

		return result;
	}
	

}
