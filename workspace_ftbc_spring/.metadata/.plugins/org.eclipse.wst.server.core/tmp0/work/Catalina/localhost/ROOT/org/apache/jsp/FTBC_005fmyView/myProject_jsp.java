/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-10-31 00:50:06 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.FTBC_005fmyView;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class myProject_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("/FTBC_myView/../FTBC_Common/../FTBC_Common/TopMenuBar.jsp", Long.valueOf(1571276428668L));
    _jspx_dependants.put("/FTBC_myView/../FTBC_Common/FTBC_Top.jsp", Long.valueOf(1570767401653L));
    _jspx_dependants.put("/FTBC_myView/../FTBC_Common/FTBC_Common.jsp", Long.valueOf(1572228384222L));
    _jspx_dependants.put("/FTBC_myView/../FTBC_Common/../FTBC_Common/TopMenuBar_Login.jsp", Long.valueOf(1572318799382L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
 
   int cnt = 0;
   if(session.getAttribute("myPjoSize")!=null){
      cnt = Integer.parseInt(session.getAttribute("myPjoSize").toString());
   }


      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>FTBC</title>\r\n");
      out.write("<!--=============================================================================================\r\n");
      out.write("   내 가 만든 프로젝트 \r\n");
      out.write("   날짜:2019-09-16\r\n");
      out.write("================================================================================================  -->\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/jquery.min.js\"></script>\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.4.1.js\"></script>\r\n");
      out.write("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>   \r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("   href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/jquery.min.js\"></script>\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.4.1.js\"></script>\r\n");
      out.write("<script\r\n");
      out.write("   src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>\r\n");
      out.write("<link href=\"http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css\"\r\n");
      out.write("   rel=\"stylesheet\">\r\n");
      out.write("<script\r\n");
      out.write("   src=\"http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js\"></script>\r\n");
      out.write("<script\r\n");
      out.write("   src=\"http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js\"></script>\r\n");
      out.write("<!--  [iíê·¸]  -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css\">\r\n");
      out.write("<!-- include summernote css/js -->\r\n");
      out.write("<link\r\n");
      out.write("   href=\"http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css\"\r\n");
      out.write("   rel=\"stylesheet\">\r\n");
      out.write("<script\r\n");
      out.write("   src=\"http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"https://www.gstatic.com/charts/loader.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!--PG  -->\r\n");
      out.write("\r\n");
      out.write("<!-- ì¬ë¨¸ ë¸í¸ë ì¶©ëë¨\r\n");
      out.write(" <script  src=\"http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js\"></script> -->\r\n");
      out.write("<!-- iaport : PG(Payment Gateway)_ê²°ì  ëí -->\r\n");
      out.write("<script type=\"text/javascript\" src=\"https://cdn.iamport.kr/js/iamport.payment-1.1.5.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../FTBC_Common/FTBC_Common.css?WJSN\">\r\n");
      out.write("<script src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css\">\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\tbody {\r\n");
      out.write("\t\tfont-family : 'SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif';\r\n");
      out.write("\t}\r\n");
      out.write("</style>");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"myProject.css?minj32323u\">\r\n");
      out.write("<!-- ================= [고명석 2019-10-14 중간합산본 이후 추가] ========================= -->\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("   function projectDetail(pjo_code) {\r\n");
      out.write("      location.href = \"../FTBC_DetailView/ProjectDetail.jsp?pjo_code=\"+pjo_code;\r\n");
      out.write("   }\r\n");
      out.write("   var s = 0;\r\n");
      out.write("   var e = 7;\r\n");
      out.write("   function myProject(s,e){\r\n");
      out.write("      $.ajax({\r\n");
      out.write("         method:'get',\r\n");
      out.write("         url:'/Project/getMyProjects?mem_email=");
      out.print(session.getAttribute("mem_email"));
      out.write("&s='+s+'&e='+e,\r\n");
      out.write("         success:function(data){\r\n");
      out.write("            $(\"#myProject_List\").append(data);\r\n");
      out.write("            $(\"#created_num\").text(size);\r\n");
      out.write("         } \r\n");
      out.write("            \r\n");
      out.write("      });\r\n");
      out.write("   }\r\n");
      out.write("   $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.\r\n");
      out.write("        if($(window).scrollTop() == $(document).height() - $(window).height()){\r\n");
      out.write("              s = s+8;\r\n");
      out.write("              e = e+8;\r\n");
      out.write("              myProject(s,e);\r\n");
      out.write("        } \r\n");
      out.write("   });\r\n");
      out.write("   $(document).ready(function() {\r\n");
      out.write("      myProject(0,7);\r\n");
      out.write("   });\r\n");
      out.write("</script>\r\n");
      out.write("<!-- ================= [고명석 2019-10-14 중간합산본 이후 추가] ========================= -->\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<!-- 내가 만든 프로젝트 페이지는 상단바 바뀌어야함.  -->\r\n");
      out.write("\t");
      out.write('\r');
      out.write('\n');

	if(session.getAttribute("mem_email") != null) {

      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');

   String mem_email = session.getAttribute("mem_email").toString();
   String mem_pfimg = session.getAttribute("mem_pfimg").toString();
   String mem_name = session.getAttribute("mem_name").toString();
   String mem_isauthority = session.getAttribute("mem_isAuthority").toString();

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>FTBC</title>\r\n");
      out.write("<!--=============================================================================================\r\n");
      out.write("   로그인 되있을 경우에 들어갈 상단바\r\n");
      out.write("   로그인 부분이 회원이름으로.\r\n");
      out.write("   날짜:2019-09-12\r\n");
      out.write("================================================================================================  -->\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<style type=\"text/css\">\r\n");
      out.write(".FTBC_loginbar {\r\n");
      out.write("\theight: 40px;\r\n");
      out.write("\tline-height: 40px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#topMenuBar_bar {\r\n");
      out.write("\theight: 65px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#topMenuBar_menus a, #top_login a {\r\n");
      out.write("\tcolor: black;\r\n");
      out.write("\tfont-size: 14px;\r\n");
      out.write("\tline-height: 20px !important;\r\n");
      out.write("\tfont-weight: bold;\r\n");
      out.write("\ttext-decoration: none !important;\r\n");
      out.write("\tvertical-align: -webkit-baseline-middle;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#topMenuBar_bar a:hover {\r\n");
      out.write("\tcolor: #8b8b8b;\r\n");
      out.write("\tbackground: none;\r\n");
      out.write("\tbackground-color: white;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#topMenuBar_menus {\r\n");
      out.write("\tmargin-top: 5px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#TopMenuBar_Login_mem_pfimg {\r\n");
      out.write("\tmargin-left: 10px;\r\n");
      out.write("\twidth: 40px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#topMenuBar_FTBClogo {\r\n");
      out.write("\theight: 30px;\r\n");
      out.write("\tmargin-top: -5px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\t<div id=\"topMenuBar_bar\">\r\n");
      out.write("\t\t<div class=\"col-xs-2 \"></div>\r\n");
      out.write("\t\t<!--===============[ 메뉴 ] =============-->\r\n");
      out.write("\t\t<div class=\"col-xs-2 FTBC_loginbar\">\r\n");
      out.write("\t\t\t<div class=\"dropdown\" id=\"topMenuBar_menus\">\r\n");
      out.write("\t\t\t\t<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"\r\n");
      out.write("\t\t\t\t\trole=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\"> <i\r\n");
      out.write("\t\t\t\t\tclass=\"fa fa-list\"></i>프로젝트 <span class=\"caret\"></span></a>\r\n");
      out.write("\t\t\t\t<ul class=\"dropdown-menu\" aria-labelledby=\"about-us\">\r\n");
      out.write("\t\t\t\t\t<li><a href=\"../FTBC_LookView/LookAround_Project.jsp\">프로젝트\r\n");
      out.write("\t\t\t\t\t\t\t둘러보기 </a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"../FTBC_CreateView/CreatProject_Terms.jsp\">프로젝트\r\n");
      out.write("\t\t\t\t\t\t\t올리기</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"../FTBC_BlockChainView/BlockChain_Main2.jsp\">프로젝트\r\n");
      out.write("\t\t\t\t\t\t\t블록체인</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"col-xs-1 \"></div>\r\n");
      out.write("\t\t<!--===============[ 타이틀 ]==============-->\r\n");
      out.write("\t\t<div class=\"col-xs-2 FTBC_loginbar\">\r\n");
      out.write("\t\t\t<div id=\"topMenuBar_title\" class=\"collapse navbar-collapse\"\">\r\n");
      out.write("\t\t\t\t<ul id=\"topMenuBar_title\" class=\"nav nav-justified\">\r\n");
      out.write("\t\t\t\t\t<li><a href=\"../FTBC_MainView/FTBC_Main.jsp\"><img\r\n");
      out.write("\t\t\t\t\t\t\tid=\"topMenuBar_FTBClogo\" src=\"../FTBC_Images/logo.png\"></a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"col-xs-1 \"></div>\r\n");
      out.write("\t\t<!--===============[ 로그인 ]==============-->\r\n");
      out.write("\t\t<div class=\"col-xs-3 FTBC_loginbar\">\r\n");
      out.write("\t\t\t<div class=\"collapse navbar-collapse\">\r\n");
      out.write("\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t\t<ul id=\"top_login\" class=\"nav nav-justified\">\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"/FTBC_myView/myPage.jsp\" id=\"mem_name\"\r\n");
      out.write("\t\t\t\t\t\t\tstyle=\"padding: 10px 0 0 0;\"> <i class=\"fa fa-search\"></i> ");
      out.print(mem_name );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<img src=\"");
      out.print(mem_pfimg );
      out.write("\" id=\"TopMenuBar_Login_mem_pfimg\"></a></li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write('\r');
      out.write('\n');

	}
	else {

      out.write("\t\t\t\t\r\n");
      out.write("\r\n");
      out.write("  <!--=============================================================================================\r\n");
      out.write("\t로그인 안되있을 경우에 들어갈 상단바\r\n");
      out.write("\t날짜:2019-09-12\r\n");
      out.write("================================================================================================  -->\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\t#topMenuBar_bar{\r\n");
      out.write("\t\tpadding-top:10px;\r\n");
      out.write("\t\theight:55px;\r\n");
      out.write("\t\tbackground-color: white;\r\n");
      out.write("\t}\r\n");
      out.write("\t#topMenuBar_menus a, #top_login a{\r\n");
      out.write("\t\tcolor:black;\r\n");
      out.write("\t\tfont-size:14px;\r\n");
      out.write("\t\tfont-weight: bold;\r\n");
      out.write("\t\ttext-decoration:none !important;\t\t\r\n");
      out.write("\t\tvertical-align: -webkit-baseline-middle;\r\n");
      out.write("\t}\r\n");
      out.write("\t#topMenuBar_bar a:hover{\r\n");
      out.write("\t\t color: #8b8b8b;\r\n");
      out.write("\t\t background-size:auto;\r\n");
      out.write("\t\t background-color: white;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t#topMenuBar_menus{\r\n");
      out.write("\t\tmargin-top:5px;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.fa-bars{\r\n");
      out.write("\t\tmargin-right:5px;\r\n");
      out.write("\t}\r\n");
      out.write("\t#topMenuBar_FTBClogo{\r\n");
      out.write("\t\theight: 30px;\r\n");
      out.write("\t\tmargin-top:-5px;\r\n");
      out.write("\t}\r\n");
      out.write("</style>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\tfunction topLogin() {\r\n");
      out.write("\t\tvar url = window.location.href;\r\n");
      out.write("\t\tconsole.log(\"url : \"+url);\r\n");
      out.write("\t\tlocation.href=\"../FTBC_MainView/FTBC_LoginLayout.jsp?preURL=\"+url;\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("<div id=\"topMenuBar_bar\">\r\n");
      out.write("\t<div class=\"col-xs-2 \"></div>\r\n");
      out.write("\t   <!--===============[ 메뉴 ] =============-->\r\n");
      out.write("    <div class=\"col-xs-2 \">\r\n");
      out.write("\t\t<div class=\"dropdown\" id=\"topMenuBar_menus\">\t\t\r\n");
      out.write("\t\t\t<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n");
      out.write("\t\t\t<i class=\"fa fa-bars\"></i>프로젝트 <span class=\"caret\"></span></a>\r\n");
      out.write("\t\t\t<ul class=\"dropdown-menu\" aria-labelledby=\"about-us\">\r\n");
      out.write("\t\t\t<li><a href=\"../FTBC_LookView/LookAround_Project.jsp\">프로젝트 둘러보기 </a></li>\r\n");
      out.write("              <li><a href=\"../FTBC_CreateView/CreatProject_Terms.jsp\">프로젝트 올리기</a></li>\r\n");
      out.write("              <li><a href=\"../FTBC_BlockChainView/BlockChain_Main2.jsp\">프로젝트 블록체인</a></li>  \r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("     </div>\r\n");
      out.write("     \t<div class=\"col-xs-1 \"></div>\r\n");
      out.write("        <!--===============[ 타이틀 ]==============-->\r\n");
      out.write("      <div class=\"col-xs-2 \">\r\n");
      out.write("         <div id=\"topMenuBar_title\"  class=\"collapse navbar-collapse\" \">\r\n");
      out.write("            <ul id=\"topMenuBar_title\" class=\"nav nav-justified\">\r\n");
      out.write("                <li><a href=\"../FTBC_MainView/FTBC_Main.jsp\"><img id=\"topMenuBar_FTBClogo\" src=\"../FTBC_Images/logo.png\"></a></li>\r\n");
      out.write("            </ul>                \r\n");
      out.write("          </div>\r\n");
      out.write("      </div>\r\n");
      out.write("      \t<div class=\"col-xs-1 \"></div>\r\n");
      out.write("       <!--===============[ 로그인 ]==============-->\r\n");
      out.write("      <div class=\"col-xs-3 \">\r\n");
      out.write("        <div class=\"collapse navbar-collapse\" \">\r\n");
      out.write("           <ul id=\"top_login\" class=\"nav nav-justified\">\r\n");
      out.write("              <li><a href=\"javascript: topLogin()\" id=\"topLogin\">로그인</a></li>\r\n");
      out.write("            </ul>                \r\n");
      out.write("        </div>\r\n");
      out.write("     </div>\r\n");
      out.write("</div>\r\n");
      out.write("</html>\r\n");
      out.write('\r');
      out.write('\n');
 
	}

      out.write('	');
      out.write('	');
      out.write("\r\n");
      out.write("\t<div class=\"container-fluid\">\r\n");
      out.write("\t\t<div class=\"row\" id=\"myProject_top\">\r\n");
      out.write("\t\t\t<div class=\"row\" id=\"myProject_pfd\">\r\n");
      out.write("\t\t\t\t<img src=\"");
      out.print(session.getAttribute("mem_pfimg").toString() );
      out.write("\"\r\n");
      out.write("\t\t\t\t\tid=\"myProject_pfimg\" width=150px>\r\n");
      out.write("\t\t\t\t<h3>\r\n");
      out.write("\t\t\t\t\t<span id=\"my_mem_name\">");
      out.print(session.getAttribute("mem_nickname").toString() );
      out.write("</span>님이\r\n");
      out.write("\t\t\t\t\t만든 프로젝트 현황\r\n");
      out.write("\t\t\t\t</h3>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<div class=\"row\" id=\"myProject_content\">\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<div class=\"col-xs-2\">&nbsp;</div>\r\n");
      out.write("\t\t\t\t<div class=\"col-xs-8\">\r\n");
      out.write("\t\t\t\t\t<div id=\"myProject_spans\">\r\n");
      out.write("\t\t\t\t\t\t<span id=\"created_project\">만든 프로젝트 </span> <span id=\"created_num\">");
      out.print(cnt);
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t\t<span>개</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div id=\"myProject_List\" ></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"col-xs-2\">&nbsp;</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
