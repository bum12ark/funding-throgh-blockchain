/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-10-25 01:15:22 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.FTBC_005fTest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class TimeTest_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

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

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/jquery.min.js\"></script>\r\n");
      out.write("<script\r\n");
      out.write("   src=\"http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\tfunction CountDownTimer(duration, granularity) {\r\n");
      out.write("\t\t\tthis.duration = duration;\r\n");
      out.write("\t\t\tthis.granularity = granularity || 1000;\r\n");
      out.write("\t\t\tthis.tickFtns = [];\r\n");
      out.write("\t\t\tthis.running = false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\tCountDownTimer.prototype.start = function() {\r\n");
      out.write("\t\t\tif (this.running) {\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tthis.running = true;\r\n");
      out.write("\t\t\tvar start = Date.now(), that = this, diff, obj;\r\n");
      out.write("\r\n");
      out.write("\t\t\t(function timer() {\r\n");
      out.write("\t\t\t\tdiff = that.duration - (((Date.now() - start) / 1000) | 0);\r\n");
      out.write("\r\n");
      out.write("\t\t\t\tif (diff > 0) {\r\n");
      out.write("\t\t\t\t\tsetTimeout(timer, that.granularity);\r\n");
      out.write("\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\tdiff = 0;\r\n");
      out.write("\t\t\t\t\tthat.running = false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t\t\tobj = CountDownTimer.parse(diff);\r\n");
      out.write("\t\t\t\tthat.tickFtns.forEach(function(ftn) {\r\n");
      out.write("\t\t\t\t\tftn.call(this, obj.minutes, obj.seconds);\r\n");
      out.write("\t\t\t\t}, that);\r\n");
      out.write("\t\t\t}());\r\n");
      out.write("\t\t};\r\n");
      out.write("\r\n");
      out.write("\t\tCountDownTimer.prototype.onTick = function(ftn) {\r\n");
      out.write("\t\t\tif (typeof ftn === 'function') {\r\n");
      out.write("\t\t\t\tthis.tickFtns.push(ftn);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\treturn this;\r\n");
      out.write("\t\t};\r\n");
      out.write("\r\n");
      out.write("\t\tCountDownTimer.prototype.expired = function() {\r\n");
      out.write("\t\t\treturn !this.running;\r\n");
      out.write("\t\t};\r\n");
      out.write("\r\n");
      out.write("\t\tCountDownTimer.parse = function(seconds) {\r\n");
      out.write("\t\t\treturn {\r\n");
      out.write("\t\t\t\t'minutes' : (seconds / 60) | 0,\r\n");
      out.write("\t\t\t\t'seconds' : (seconds % 60) | 0\r\n");
      out.write("\t\t\t};\r\n");
      out.write("\t\t};\r\n");
      out.write("\r\n");
      out.write("\t\twindow.onload = function() {\r\n");
      out.write("\r\n");
      out.write("\t\t\t//시간 보여주기\r\n");
      out.write("\t\t\tvar display = document.querySelector('#time'), timer = new CountDownTimer(\r\n");
      out.write("\t\t\t\t\t120); //시간 설정, 초단위\r\n");
      out.write("\r\n");
      out.write("\t\t\ttimer.onTick(format).onTick(restart).start(); //restart호출\r\n");
      out.write("\r\n");
      out.write("\t\t\tfunction restart() { //시간이 끝나면 다시 시작\r\n");
      out.write("\r\n");
      out.write("\t\t\t\tif (this.expired()) {\r\n");
      out.write("\t\t\t\t\tconsole.log(\"블럭생성 완료\");\r\n");
      out.write("\t\t\t\t\t//# Servlet으로 블럭 보내라고 요청하기\r\n");
      out.write("\t\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\t\tmethod : 'get'\r\n");
      out.write("\t\t\t\t\t\t,url : '/restchain/majorityStart'\r\n");
      out.write("\t\t\t\t\t\t,success : function(data) {\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\tsetTimeout(function() {\r\n");
      out.write("\t\t\t\t\t\ttimer.start();\r\n");
      out.write("\t\t\t\t\t}, 1000);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t\tfunction format(minutes, seconds) {\r\n");
      out.write("\t\t\t\tminutes = minutes < 10 ? \"0\" + minutes : minutes;\r\n");
      out.write("\t\t\t\tseconds = seconds < 10 ? \"0\" + seconds : seconds;\r\n");
      out.write("\t\t\t\tdisplay.textContent = minutes + ':' + seconds;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t};\r\n");
      out.write("\t\tfunction initNewBlock() {\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\tmethod : 'get',\r\n");
      out.write("\t\t\t\turl : '/restchain/initNewBlock',\r\n");
      out.write("\t\t\t\tsuccess : function(data) {\r\n");
      out.write("\t\t\t\t\talert('NewBlock Create!');\r\n");
      out.write("\t\t\t\t\t$('#initNewBlock').attr('disabled', true);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<div>\r\n");
      out.write("\t\t블럭생성 중 <span id=\"time\"></span> minutes!\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<button id=\"initNewBlock\" onclick=\"initNewBlock()\">최초 블럭 생성</button>\r\n");
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