/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-10-16 13:32:24 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.FTBC_005fBlockChainView;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Map;
import java.util.List;
import com.chain.util.PageBar2;

public final class BlockChain_005fMain_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("/FTBC_Common/FTBC_Top.jsp", Long.valueOf(1570767401653L));
    _jspx_dependants.put("/FTBC_Common/FTBC_Common.jsp", Long.valueOf(1571020944368L));
    _jspx_dependants.put("/FTBC_Common/../FTBC_Common/TopMenuBar_Login.jsp", Long.valueOf(1571022992835L));
    _jspx_dependants.put("/FTBC_Common/../FTBC_Common/TopMenuBar.jsp", Long.valueOf(1571140476886L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("java.util.Map");
    _jspx_imports_classes.add("com.chain.util.PageBar2");
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>???????????? ??????</title>\r\n");
      out.write("<!--=============================================================================================\r\n");
      out.write("\t???????????? ??????  ?????????  \r\n");
      out.write("\t??????:2019-09-19\r\n");
      out.write("\t?????? ?????????\r\n");
      out.write("\t????????? ????????? ????????? https://stackoverflow.com/questions/31617328/how-get-td-click-event-from-bootstrap-table \r\n");
      out.write("\t\t\t\t   http://jsfiddle.net/oh16h7cj/\r\n");
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
      out.write("<!--  [i????????????]  -->\r\n");
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
      out.write("<!-- ???????????? ?????????????????? ??????????????????\r\n");
      out.write(" <script  src=\"http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js\"></script> -->\r\n");
      out.write("<!-- iaport : PG(Payment Gateway)_???????????? ???????????? -->\r\n");
      out.write("<script type=\"text/javascript\" src=\"https://cdn.iamport.kr/js/iamport.payment-1.1.5.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../FTBC_Common/FTBC_Common.css?WJSN\">\r\n");
      out.write("<script src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css\">");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\"\r\n");
      out.write("\thref=\"/FTBC_BlockChainView/BlockChain_Main.css?sibal\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t");

		String context = null;
		String keyword = null;
		if (request.getParameter("context") != null && request.getParameter("keyword") != null) {
			context = request.getParameter("context");
			keyword = request.getParameter("keyword");
		} else {
			context = "???";
			keyword = "???";
		}
	
      out.write("\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\tvar keyword = '");
      out.print(keyword);
      out.write("';\r\n");
      out.write("\t\tvar context = '");
      out.print(context);
      out.write("';\r\n");
      out.write("\t\t$(document).ready(function() {\r\n");
      out.write("\t\t\tconsole.log(\"keyword : \"+keyword);\r\n");
      out.write("\t\t\tconsole.log(\"context : \"+context);\r\n");
      out.write("\t\t\tif((keyword != \"???\") && (context != \"???\")) {\r\n");
      out.write("\t\t\t\t$(\"input[name=input_search]\").val(context);\r\n");
      out.write("\t\t\t\t$(\"#selected_bar\").val(keyword);\r\n");
      out.write("\t\t\t} \r\n");
      out.write("\t\t});\r\n");
      out.write("\t\tfunction blockDetail(num) {\r\n");
      out.write("\t\t\tconsole.log(\"num : \"+num);\r\n");
      out.write("\t\t\t/*  location.href=\"/FTBC_BlockChainView/Transaction_Certificate.jsp?num=\"+num;  */\r\n");
      out.write("\t\t\t$(\"input[name=rownum]\").val(num);\r\n");
      out.write("\t\t\t$(\"input[name=password]\").val('');\r\n");
      out.write("\t\t\t$(\"input[name=writer]\").prop('checked', false);\r\n");
      out.write("\t\t\t$(\"#myModal\").modal();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tfunction confirmClick() {\r\n");
      out.write("\t\t\tvar num = $(\"input[name=rownum]\").val();\r\n");
      out.write("\t\t\tconsole.log(\"num : \"+num);\r\n");
      out.write("\t\t\tconsole.log(\"donator isChecked : \"+$(\"#donator\").is(\":checked\"));\r\n");
      out.write("\t\t\tconsole.log(\"creator isChecked : \"+$(\"#creator\").is(\":checked\"));\r\n");
      out.write("\t\t\tvar id;\r\n");
      out.write("\t\t\tvar writer;\r\n");
      out.write("\t\t\tif($(\"#donator\").is(\":checked\")) {\r\n");
      out.write("\t\t\t\tid = $(\"#td_mem_publickey\"+num).text();\r\n");
      out.write("\t\t\t\twriter = 'donator';\r\n");
      out.write("\t\t\t} else if($(\"#creator\").is(\":checked\")){\r\n");
      out.write("\t\t\t\tid = $(\"#td_pj_publickey\"+num).text();\r\n");
      out.write("\t\t\t\twriter = 'creator';\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\tid = null;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("        \t// ????????????????????? ?????? ??? '+' ????????? ??????????????? ??????????????? ????????? ???????????? ?????? ??????\r\n");
      out.write("        \tif(id != null) id = id.replace(/\\+/g,\"%2B\");\r\n");
      out.write("\t\t\tvar password = $(\"input[name=password]\").val();\r\n");
      out.write("\t\t\tconsole.log(\"id : \"+id);\r\n");
      out.write("\t\t\tconsole.log(\"password : \"+password);\r\n");
      out.write("\t\t\tvar isFullWritting = false;\r\n");
      out.write("\t\t\tif(id == null || password == \"\") {\r\n");
      out.write("\t\t\t\talert(\"?????? ????????? ??????????????????.\");\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\tmethod:'GET',\r\n");
      out.write("\t\t\t\t\turl:'/restchain/isAuthorized?writer='+writer+'&password='+password+'&id='+id,\r\n");
      out.write("\t\t\t\t\tsuccess:function(data){\r\n");
      out.write("\t\t\t\t\t\tconsole.log(\"ajax_data : \"+data);\r\n");
      out.write("\t\t\t\t\t\tif(data == \"??????????????? ???????????? ????????????.\") {\r\n");
      out.write("\t\t\t\t\t\t\talert(\"??????????????? ???????????? ????????????.\");\r\n");
      out.write("\t\t\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\t\t\tlocation.href=\"/FTBC_BlockChainView/Transaction_Certificate.jsp?num=\"+num;\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tfunction detailSearch(){\r\n");
      out.write("\t\t\tvar detailContext = $(\"input[name=input_search]\").val();\r\n");
      out.write("\t\t\tvar detailKeyword = $(\"#selected_bar option:selected\").val();\r\n");
      out.write("\t\t\tif(keyword == \"????????????\") {\r\n");
      out.write("\t\t\t\talert(\"?????? ????????? ??????????????????.\");\r\n");
      out.write("\t\t\t} else if(context ==  \"\") {\r\n");
      out.write("\t\t\t\talert(\"????????? ???????????? ??????????????????.\");\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\tlocation.href='/chain/getBlockChainInfo?context='+detailContext+'&keyword='+detailKeyword+'&nowPage='+0;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tfunction sibal(sibalnum) { // ????????? ?????? ??????\r\n");
      out.write("\t\t\tconsole.log(\"sibalnum : \"+sibalnum);\r\n");
      out.write("\t\t\tconsole.log(\"sibal_context : \"+context);\r\n");
      out.write("\t\t\tconsole.log(\"sibal_keyword : \"+keyword);\r\n");
      out.write("\t\t\tif(context != \"???\" && keyword != \"???\") { // ??????????????? ??????\r\n");
      out.write("\t\t\t\talert(\"?????? ??? ?????? ??????!\");\r\n");
      out.write("\t\t\t\tlocation.href = \"/chain/getBlockChainInfo?nowPage=\"+sibalnum+\"&keyword=\"+keyword+\"&context=\"+context;\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\talert(\"?????? ??? ???!\");\r\n");
      out.write("\t\t\t\tlocation.href = \"/chain/getBlockChainInfo?nowPage=\"+sibalnum;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</script>\r\n");
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
      out.write("\t????????? ????????? ????????? ????????? ?????????\r\n");
      out.write("\t????????? ????????? ??????????????????.\r\n");
      out.write("\t??????:2019-09-12\r\n");
      out.write("================================================================================================  -->\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<style type=\"text/css\">\r\n");
      out.write("\t\r\n");
      out.write("   .FTBC_loginbar{\r\n");
      out.write("       height: 40px;\r\n");
      out.write("       line-height:40px;\r\n");
      out.write("   }\r\n");
      out.write("   #topMenuBar_bar{\r\n");
      out.write("      height:65px;\r\n");
      out.write("   }\r\n");
      out.write("   #topMenuBar_menus a, #top_login a{\r\n");
      out.write("      color:black;\r\n");
      out.write("      font-size:14px;\r\n");
      out.write("      line-height:20px !important;\r\n");
      out.write("      font-weight: bold;\r\n");
      out.write("      text-decoration:none !important;   \r\n");
      out.write("      vertical-align: -webkit-baseline-middle;   \r\n");
      out.write("   }\r\n");
      out.write("   #topMenuBar_bar a:hover{\r\n");
      out.write("       color: #8b8b8b;\r\n");
      out.write("       background:none;\r\n");
      out.write("       background-color: white;\r\n");
      out.write("   }\r\n");
      out.write("   #topMenuBar_menus{\r\n");
      out.write("      margin-top:5px;\r\n");
      out.write("   }\r\n");
      out.write("   #TopMenuBar_Login_mem_pfimg{\r\n");
      out.write("      margin-left:10px;\r\n");
      out.write("      width:40px;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   #topMenuBar_FTBClogo{\r\n");
      out.write("      height: 30px;\r\n");
      out.write("      margin-top:-5px;\r\n");
      out.write("   }\r\n");
      out.write("</style>\r\n");
      out.write("\t<div id=\"topMenuBar_bar\">\r\n");
      out.write("\t\t<div class=\"col-xs-2 \"></div>\r\n");
      out.write("\t\t<!--===============[ ?????? ] =============-->\r\n");
      out.write("\t\t<div class=\"col-xs-2 FTBC_loginbar\">\r\n");
      out.write("\t\t\t<div class=\"dropdown\" id=\"topMenuBar_menus\">\r\n");
      out.write("\t\t\t\t<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"\r\n");
      out.write("\t\t\t\t\trole=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\"> <i\r\n");
      out.write("\t\t\t\t\tclass=\"fa fa-list\"></i>???????????? <span class=\"caret\"></span></a>\r\n");
      out.write("\t\t\t\t<ul class=\"dropdown-menu\" aria-labelledby=\"about-us\">\r\n");
      out.write("\t\t\t\t\t<li><a href=\"../FTBC_LookView/LookAround_Project.jsp\">????????????\r\n");
      out.write("\t\t\t\t\t\t\t???????????? </a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"../FTBC_CreateView/CreatProject_Terms.jsp\">????????????\r\n");
      out.write("\t\t\t\t\t\t\t?????????</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"../FTBC_BlockChainView/BlockChain_Main.jsp\">????????????\r\n");
      out.write("\t\t\t\t\t\t\t????????????</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"col-xs-1 \"></div>\r\n");
      out.write("\t\t<!--===============[ ????????? ]==============-->\r\n");
      out.write("\t\t<div class=\"col-xs-2 FTBC_loginbar\">\r\n");
      out.write("\t\t\t<div id=\"topMenuBar_title\" class=\"collapse navbar-collapse\"\">\r\n");
      out.write("\t\t\t\t<ul id=\"topMenuBar_title\" class=\"nav nav-justified\">\r\n");
      out.write("\t\t\t\t\t<li><a href=\"../FTBC_MainView/FTBC_Main.jsp\"><img\r\n");
      out.write("\t\t\t\t\t\t\tid=\"topMenuBar_FTBClogo\" src=\"../FTBC_Images/logo.png\"></a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"col-xs-1 \"></div>\r\n");
      out.write("\t\t<!--===============[ ????????? ]==============-->\r\n");
      out.write("\t\t<div class=\"col-xs-3 FTBC_loginbar\">\r\n");
      out.write("\t\t\t<div class=\"collapse navbar-collapse\">\r\n");
      out.write("\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t\t<ul id=\"top_login\" class=\"nav nav-justified\">\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"../FTBC_myView/myPage.jsp\" id=\"mem_name\"> <i\r\n");
      out.write("\t\t\t\t\t\t\t\tclass=\"fa fa-search\"></i> ");
      out.print(mem_name );
      out.write(" <img\r\n");
      out.write("\t\t\t\t\t\t\t\tsrc=\"");
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
      out.write("\t????????? ???????????? ????????? ????????? ?????????\r\n");
      out.write("\t??????:2019-09-12\r\n");
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
      out.write("\t   <!--===============[ ?????? ] =============-->\r\n");
      out.write("    <div class=\"col-xs-2 \">\r\n");
      out.write("\t\t<div class=\"dropdown\" id=\"topMenuBar_menus\">\t\t\r\n");
      out.write("\t\t\t<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n");
      out.write("\t\t\t<i class=\"fa fa-bars\"></i>???????????? <span class=\"caret\"></span></a>\r\n");
      out.write("\t\t\t<ul class=\"dropdown-menu\" aria-labelledby=\"about-us\">\r\n");
      out.write("\t\t\t<li><a href=\"../FTBC_LookView/LookAround_Project.jsp\">???????????? ???????????? </a></li>\r\n");
      out.write("              <li><a href=\"../FTBC_CreateView/CreatProject_Terms.jsp\">???????????? ?????????</a></li>\r\n");
      out.write("              <li><a href=\"/chain/getBlockChainInfo\">???????????? ????????????</a></li>  \r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("     </div>\r\n");
      out.write("     \t<div class=\"col-xs-1 \"></div>\r\n");
      out.write("        <!--===============[ ????????? ]==============-->\r\n");
      out.write("      <div class=\"col-xs-2 \">\r\n");
      out.write("         <div id=\"topMenuBar_title\"  class=\"collapse navbar-collapse\" \">\r\n");
      out.write("            <ul id=\"topMenuBar_title\" class=\"nav nav-justified\">\r\n");
      out.write("                <li><a href=\"../FTBC_MainView/FTBC_Main.jsp\"><img id=\"topMenuBar_FTBClogo\" src=\"../FTBC_Images/logo.png\"></a></li>\r\n");
      out.write("            </ul>                \r\n");
      out.write("          </div>\r\n");
      out.write("      </div>\r\n");
      out.write("      \t<div class=\"col-xs-1 \"></div>\r\n");
      out.write("       <!--===============[ ????????? ]==============-->\r\n");
      out.write("      <div class=\"col-xs-3 \">\r\n");
      out.write("        <div class=\"collapse navbar-collapse\" \">\r\n");
      out.write("           <ul id=\"top_login\" class=\"nav nav-justified\">\r\n");
      out.write("              <li><a href=\"javascript: topLogin()\" id=\"topLogin\">?????????</a></li>\r\n");
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
      out.write("\t\t<!--  ?????? ??????  -->\r\n");
      out.write("\t\t<div class=\"row\" id=\"BlockChain_banner\">\r\n");
      out.write("\t\t\t<div class=\"col-xs-3\">&nbsp;</div>\r\n");
      out.write("\t\t\t<div class=\"col-xs-3\">\r\n");
      out.write("\t\t\t\t<h2>\r\n");
      out.write("\t\t\t\t\t?????? ??????<img src=\"/FTBC_Images/blockchainicon.png\">\r\n");
      out.write("\t\t\t\t</h2>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"col-xs-3\"></div>\r\n");
      out.write("\t\t\t<div class=\"col-xs-3\">&nbsp;</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<!--?????? ??????  -->\r\n");
      out.write("\t\t<div id=\"BlockMain_empty\" class=\"row\"></div>\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t<div id=\"Block_left\" class=\"col-sm-2\">&nbsp;</div>\r\n");
      out.write("\t\t\t<div id=\"Blcok_Center\" class=\"col-sm-8\">\r\n");
      out.write("\t\t\t\t<!-----------?????????  ----------- -->\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group col-sm-2\">\r\n");
      out.write("\t\t\t\t\t\t<select class=\"form-control\" id=\"selected_bar\">\r\n");
      out.write("\t\t\t\t\t\t\t<option disabled=\"disabled\" selected=\"selected\" value=\"????????????\">????????????</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"???????????? ??????\">???????????? ??????</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"????????? ???\">????????? ???</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"????????? ???\">????????? ???</option>\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"input-group col-sm-6\" id=\"input_search\"\r\n");
      out.write("\t\t\t\t\t\tstyle=\"float: left;\">\r\n");
      out.write("\t\t\t\t\t\t<input name=\"input_search\" type=\"text\" class=\"form-control\"\r\n");
      out.write("\t\t\t\t\t\t\tplaceholder=\"Search\" />\r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-group-btn\">\r\n");
      out.write("\t\t\t\t\t\t\t<button class=\"btn btn-default\" onclick=\"detailSearch()\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"glyphicon glyphicon-search\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-2\">\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn\"\r\n");
      out.write("\t\t\t\t\t\t\tstyle=\"background-color: #635c9f; color: #FFFFFF;\">????????????</button>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"row\" id=\"blockChain_List\">\r\n");
      out.write("\t\t\t\t\t<h2>?????? ??????</h2>\r\n");
      out.write("\t\t\t\t\t<!-----------????????? BlockChain_List??? ??? ??????  ----------- -->\r\n");
      out.write("\t\t\t\t\t");

						int numberPerPage = 10;
						int transactionSize = Integer.parseInt(request.getAttribute("transactionSize").toString());
						int nowPage = 0;
						if (request.getParameter("nowPage") != null)
							nowPage = Integer.parseInt(request.getParameter("nowPage"));
						List<Map<String, Object>> chainList = (List<Map<String, Object>>) session.getAttribute("chainList");
						int rownum = (nowPage) * numberPerPage;
						int size = chainList.size();
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<div style=\"height: 505px;\">\r\n");
      out.write("\t\t\t\t\t\t<table class=\"table\" id=\"BlockChain_Table\">\r\n");
      out.write("\t\t\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th scope=\"col\">#</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th scope=\"col\">???????????? ??????</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th scope=\"col\">???????????? ?????????</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th scope=\"col\">?????????</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th scope=\"col\">?????? ??????</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t\t");

									for (int i = 0; i < size-1; i++) {
										++rownum;
								
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr id=\"tr_");
      out.print(i);
      out.write("\" onclick=\"blockDetail(");
      out.print(i);
      out.write(")\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th width=\"150px\">");
      out.print(rownum);
      out.write("</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td style=\"cursor: pointer;\">");
      out.print(chainList.get(i).get("PJO_LONGTITLE"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td style=\"cursor: pointer;\">");
      out.print(chainList.get(i).get("CREATOR_NAME"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td style=\"cursor: pointer;\">");
      out.print(chainList.get(i).get("DONATOR_NAME"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td style=\"cursor: pointer;\">");
      out.print(chainList.get(i).get("TIMESTAMP"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td id=\"td_mem_publickey");
      out.print(i);
      out.write("\" style=\"display: none;\">");
      out.print(chainList.get(i).get("MEM_PUBLICKEY"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td id=\"td_pj_publickey");
      out.print(i);
      out.write("\" style=\"display: none;\">");
      out.print(chainList.get(i).get("PJ_PUBLICKEY"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t");

									}
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<!-----------????????? ----------- -->\r\n");
      out.write("\t\t\t\t<!-- ????????? ????????? -->\r\n");
      out.write("\t\t\t\t<div id=\"pageBar\">\r\n");
      out.write("\t\t\t\t\t");

						PageBar2 pageBar = new PageBar2(numberPerPage, transactionSize, nowPage, "/chain/getBlockChainInfo");
						String pagination = pageBar.getPageBar();
						out.print(pagination);
					
      out.write("\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div id=\"Block_Right\" class=\"col-sm-2\">&nbsp;</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<!-- Modal -->\r\n");
      out.write("\t<div class=\"modal fade\" id=\"myModal\" role=\"dialog\">\r\n");
      out.write("\t\t<div class=\"modal-dialog modal-sm\">\r\n");
      out.write("\t\t\t<div class=\"modal-content\">\r\n");
      out.write("\t\t\t\t<div class=\"modal-header\">\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\r\n");
      out.write("\t\t\t\t\t<h4 class=\"modal-title\">?????? ?????????</h4>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"modal-body\">\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"rownum\"> <label\r\n");
      out.write("\t\t\t\t\t\tclass=\"radio-inline\"><input type=\"radio\" id=\"creator\"\r\n");
      out.write("\t\t\t\t\t\tname=\"writer\" value=\"?????????\" />&nbsp;?????????</label> &nbsp;&nbsp;&nbsp; <label\r\n");
      out.write("\t\t\t\t\t\tclass=\"radio-inline\"><input type=\"radio\" id=\"donator\"\r\n");
      out.write("\t\t\t\t\t\tname=\"writer\" value=\"?????????\" />&nbsp;?????????</label> <br> <br>\r\n");
      out.write("\t\t\t\t\t<div class=\"input-group\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"input-group-addon\"><i\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"glyphicon glyphicon-lock\"></i></span> <input id=\"password\"\r\n");
      out.write("\t\t\t\t\t\t\ttype=\"password\" class=\"form-control\" name=\"password\"\r\n");
      out.write("\t\t\t\t\t\t\tplaceholder=\"Password\">\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"modal-footer\">\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"confirmClick()\">??????</button>\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">??????</button>\r\n");
      out.write("\t\t\t\t</div>\r\n");
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
