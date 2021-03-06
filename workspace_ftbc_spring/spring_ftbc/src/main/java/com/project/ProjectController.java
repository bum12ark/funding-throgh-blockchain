package com.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import vo.MemberVO;
import vo.MessageVO;
import vo.ProjectVO;


@Controller
@RequestMapping("/Project/*")
public class ProjectController  {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	ProjectLogic projectLogic = null;
	
	   @GetMapping(value="getFundedProjects")
	   public String getFundedPProject(@RequestParam String mem_email, Model mod) {
	      //내가 펀딩한 프로젝트
	      logger.info(" getFundedProject 호출");
	      List<ProjectVO> fundedProjects = projectLogic.getFundedProjects(mem_email);
	    
	      mod.addAttribute("FundedProjects",fundedProjects);
	////////////////[고명석 2019-10-14 수정]////////////////////
	      return "forward:/FTBC_myView/FundedProjectList.jsp";
	////////////////[고명석 2019-10-14 수정]////////////////////
	      
	   }
	   
	   @GetMapping(value="getMyProjects")
	   public String getMyProject(@RequestParam Map<String,Object> pMap, Model mod,HttpSession httpSession) {
	      //내가 만든 프로젝트 
	      logger.info(" getMyProject 호출");
	      String mem_email = pMap.get("mem_email").toString();
	      int s = Integer.parseInt(pMap.get("s").toString());
	      int e = Integer.parseInt(pMap.get("e").toString());
	      List<ProjectVO> projectList =  new ArrayList<ProjectVO>();
	      List<ProjectVO> myProjects = projectLogic.getMyProjects(mem_email);
	      for(int i =0 ;i<myProjects.size();i++) {
				if(s<=i&&i<=e) {
					ProjectVO pVO = myProjects.get(i);
					projectList.add(pVO);
				}
			}
	      httpSession.removeAttribute("myPjoSize");
	      if(projectList.size()>0) {
	    	  httpSession.setAttribute("myPjoSize", projectList.size());
	      }else {
	    	  httpSession.setAttribute("myPjoSize", 0);
	      }
	      mod.addAttribute("myProjects",projectList);
	////////////////[고명석 2019-10-14 수정]////////////////////      
	      return "forward:/FTBC_myView/myProjectList.jsp";
	////////////////[고명석 2019-10-14 수정]////////////////////      
	      
	   }
	
	@GetMapping(value="getMainProjects")
	public String getMainProject(Model mod) {
		//메인뷰에 뿌릴  인기, 추천, 성공임박 프로젝트 
		logger.info("내가 펀딩한 프로젝트 getMainProject 호출");
		Map<String, Object> mainProjects = projectLogic.getMainProjects();
		mod.addAttribute("mainProjects",mainProjects);
		return  "forward:/FTBC_MainView/FTBC_MainList.jsp";
	}
	@GetMapping(value="ftbc.com")
	public String getMain(Model mod) {
		return  "redirect:/FTBC_MainView/FTBC_Main.jsp";
	}
	
	//////10-16 정원형 프로젝트 디테일에서 gift 옵션 부분 뿌려주는 것 작업////////////
	@GetMapping(value="projectDetail")
	public String getProjectDetail(@RequestParam String projectCode, Model mod, String mem_email) {
		//프로젝트 상세보기
		logger.info("projectDetail 호출");
		ProjectVO projectDetail = projectLogic.getProjectDetail(projectCode,mem_email);
		List<Object> projectGiftDetail = projectLogic.getprojectGiftDetail(projectCode);
		String projectCreaterName = projectDetail.getMem_email().toString();
		int createrProjectCount = projectLogic.getCreaterProjects(projectCreaterName);
		String createrPfimg = projectLogic.getCreaterPfimg(projectCreaterName);
		List<MemberVO> fundingMember = projectLogic.fundingMember(projectCode);
		for(int i=0;i<fundingMember.size();i++) {
			MemberVO memVO = fundingMember.get(i);
			logger.info("============"+memVO.getMem_name());
		}
		projectDetail.getMem_email();
		List<ProjectVO> CreaterFundedProjects=projectLogic.getCreaterFundedProjects(projectDetail.getMem_email());
	    mod.addAttribute("CreaterFundedProjects",CreaterFundedProjects);
		mod.addAttribute("projectDetail", projectDetail);
		mod.addAttribute("projectGiftDetail",projectGiftDetail);
		mod.addAttribute("createrProjectCount",createrProjectCount);
		mod.addAttribute("createrPfimg",createrPfimg);
		mod.addAttribute("fundingMember",fundingMember);
		return "forward:/FTBC_DetailView/ProjectDetailList.jsp";
		
	}
	//////10-16 정원형 프로젝트 디테일에서 gift 옵션 부분 뿌려주는 것 작업////////////
	
	@GetMapping(value="getDiscoverProjects")
	public String getDiscoverProjects(@RequestParam Map<String,Object> pMap , Model mod) {
		//모든, 인기, 성공임박, 새로운 프로젝트 페이지에 뿌릴
		logger.info("getDiscoverProjects 호출");
		int start = Integer.parseInt(pMap.get("start").toString());
		int end = Integer.parseInt(pMap.get("end").toString());
		String sort = pMap.get("sort").toString();
		List<ProjectVO> projectList =  new ArrayList<ProjectVO>();
		List<ProjectVO> projectLists = projectLogic.getDiscoverProjects(sort);
		int cnt = 0;
		for(int i =0 ;i<projectLists.size();i++) {
			if(start<=i&&i<=end) {
				ProjectVO pVO = projectLists.get(i);
				projectList.add(pVO);
					
			}
		}
		if(projectList.size()<4) {
			//마감된 프로젝트 가져오기
		}
		mod.addAttribute("projectList", projectList);
		return "forward:/FTBC_LookView/Discover_ProjectList.jsp";
	}
	
	@GetMapping(value="getKeywordProjects")
	public String getKeywordProjects(@RequestParam Map<String,Object> pMap, Model mod) {
		logger.info("getKeywordProjects 호출");
		//검색한 키워드로 
		String keyword = pMap.get("Keyword").toString();
		int s = Integer.parseInt(pMap.get("s").toString());
		int e = Integer.parseInt(pMap.get("e").toString());
		List<ProjectVO> projectLists = projectLogic.getKeywordProjects(keyword);
		List<ProjectVO> projectList =  new ArrayList<ProjectVO>();
		for(int i =0 ;i<projectLists.size();i++) {
			if(s<=i&&i<=e) {
				ProjectVO pVO = projectLists.get(i);
				projectList.add(pVO);
			}
		}
		mod.addAttribute("projectList", projectList);
		mod.addAttribute("keyword",keyword);
		return "forward:/FTBC_LookView/Keyword_ProjectList.jsp";
	}
	
	@GetMapping(value="getCategoryProjects")
	public String getCategoryProjects(@RequestParam Map<String,Object> pMap, Model mod) {
		logger.info("getCategoryProjects 호출");
		//카테고리 별로 
		List<ProjectVO> projectLists = projectLogic.getCategoryProjects(pMap);
		List<ProjectVO> projectList =  new ArrayList<ProjectVO>();
		String cat = null;
		int s = Integer.parseInt(pMap.get("s").toString());
		int e = Integer.parseInt(pMap.get("e").toString());
		if(pMap.get("subcat_name").equals("undefined")) {
			cat = pMap.get("maincat_name").toString();
		}else {
			cat = pMap.get("subcat_name").toString();
		}
		mod.addAttribute("cat",cat);
		for(int i =0 ;i<projectLists.size();i++) {
			logger.info("s : "+s+" e : "+e);
			if(s<=i&&i<=e) {
				ProjectVO pVO = projectLists.get(i);
				projectList.add(pVO);
			}
		}
		mod.addAttribute("projectList", projectList);
		return "forward:/FTBC_LookView/Category_ProjectList.jsp";
	}
	@GetMapping(value="getMemAge")
	public String getMemAge(@RequestParam String pjo_code,Model mod) {
		Map<String,Object> pMap = new HashMap<String, Object>();
		pMap = projectLogic.chartcnt(pjo_code);
		mod.addAttribute("pMap",pMap);
		return "forward:/FTBC_DetailView/toJson.jsp";
	}
	@GetMapping(value="getmypjogiftOption")
	public String getmypjogiftOption(@RequestParam Map<String,Object> pMap,Model mod) {
		List<Map<String, Object>> getmypjogiftOption = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> gopOption = new ArrayList<Map<String,Object>>();
		List<Object> all = new ArrayList<Object>();
		all = projectLogic.getmypjogiftOption(pMap.get("project_code").toString(),pMap.get("txId").toString());
		getmypjogiftOption= (List<Map<String, Object>>) all.get(0);
		gopOption = (List<Map<String, Object>>) all.get(1);
		mod.addAttribute("getmypjogiftOption",getmypjogiftOption);
		mod.addAttribute("gopOption",gopOption);
		return "forward:/FTBC_myView/myProjectOptionModal.jsp";
	}

	 @RequestMapping("getProjectTable")
	   public @ResponseBody Map<String, List<ProjectVO>> getProjectTable(@RequestParam String mem_email, Model mod) {
		   List<ProjectVO> getProjectTable = projectLogic.getProjectTable(mem_email);
		   Map<String, List<ProjectVO>> dataMap = new HashMap<>();
		   dataMap.put("data",getProjectTable);
		   return dataMap;
	   }
	 @RequestMapping("getmyProjectOption")
	 public @ResponseBody Map<String, List<ProjectVO>> getmyProjectOption(@RequestParam String project_code, Model mod) {
		 logger.info("??");
		 List<ProjectVO> getmyProjectOption = projectLogic.getProjectOption(project_code);
		 Map<String, List<ProjectVO>> dataMap = new HashMap<>();
		 dataMap.put("data",getmyProjectOption);
		 return dataMap;
	 }
	 @RequestMapping("ApproveProject")
	 public String approveProject (@RequestParam String projectCode) {
		 logger.info("approveProject 호출");
		 projectLogic.ApporveProject(projectCode);
		 return "redirect:/FTBC_DetailView/ProjectDetail.jsp?pjo_code="+projectCode;
	 }
}
