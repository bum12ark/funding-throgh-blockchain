/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-10-28 02:15:32 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.FTBC_005fBlockChainView;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import vo.ChainVO;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Map;
import java.util.List;

public final class Transaction_005fCertificate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/FTBC_BlockChainView/../FTBC_Common/FTBC_Common.jsp", Long.valueOf(1572228384222L));
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
    _jspx_imports_classes.add("java.text.DecimalFormat");
    _jspx_imports_classes.add("vo.ChainVO");
    _jspx_imports_classes.add("java.util.ArrayList");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>FTBC ?????????</title>\r\n");
      out.write("<script\r\n");
      out.write("\tsrc=\"https://cdn.rawgit.com/eligrey/FileSaver.js/5ed507ef8aa53d8ecfea96d96bc7214cd2476fd2/FileSaver.min.js\"></script>\r\n");
      out.write("<script\r\n");
      out.write("\tsrc=\"https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.js\"></script>\r\n");
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
      out.write("<link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css\">\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\tbody {\r\n");
      out.write("\t\tfont-family : 'SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif';\r\n");
      out.write("\t}\r\n");
      out.write("</style>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".html2canvas-container {\r\n");
      out.write("\twidth: 3000px !important;\r\n");
      out.write("\theight: 3000px !important;\r\n");
      out.write("\talign-content: center !important;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".container {\r\n");
      out.write("\ttext_align: center;\r\n");
      out.write("\tzoom: 0.7;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#download_Tx {\r\n");
      out.write("\tmargin-top: -20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".tx_info {\r\n");
      out.write("\tleft: 350px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#d_tx_id>span {\r\n");
      out.write("\tfont-size: 28px;\r\n");
      out.write("\tfont-weight: bold;\r\n");
      out.write("\tcolor: #4c4c4c;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".d_tx_content {\r\n");
      out.write("\tfont-size: 25px;\r\n");
      out.write("\tfont-family: Gungsuh;\r\n");
      out.write("\tcolor: #4c4c4c;\r\n");
      out.write("\tpadding-top: 25px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#tx_contents {\r\n");
      out.write("\tmargin-top: 30px;\r\n");
      out.write("\ttext-align: left !important;\r\n");
      out.write("\tleft: 300px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".span_list {\r\n");
      out.write("\tdisplay: inline-block;\r\n");
      out.write("\twidth: 185px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#saveTX {\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("\tfont-size: 14px;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\tvertical-align: middle;\r\n");
      out.write("\tbackground-color: #635c9f;\r\n");
      out.write("\theight: 40px;\r\n");
      out.write("\twidth: 144px;\r\n");
      out.write("\tborder-radius: 5px;\r\n");
      out.write("\tborder: none;\r\n");
      out.write("\toutline: none;\r\n");
      out.write("\tmargin-left: 51%;\r\n");
      out.write("\tmargin-bottom: 20px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("\t$(function(){\r\n");
      out.write("\t   $(\"#saveTX\").click(function() { \r\n");
      out.write("\t\r\n");
      out.write("\t        html2canvas($(\"#download_Tx\"), {\r\n");
      out.write("\t\r\n");
      out.write("\t            onrendered: function(canvas) {\r\n");
      out.write("\t\r\n");
      out.write("\t                canvas.toBlob(function(blob) {\r\n");
      out.write("\t\r\n");
      out.write("\t                    saveAs(blob, 'FTBC_transaction.png');\r\n");
      out.write("\t                });\r\n");
      out.write("\t            }\r\n");
      out.write("\t        });\r\n");
      out.write("\t    });\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");

	ChainVO chainVO = (ChainVO) request.getAttribute("chainVO");
	List<String> hashList = new ArrayList<>();
	String blockHash = chainVO.getBlockHash();
	hashList.add(blockHash.substring(0, blockHash.length()/2));
	hashList.add(blockHash.substring(blockHash.length()/2));
	List<String> txList = new ArrayList<>();
	String txID = chainVO.getTx_id();
	txList.add(txID.substring(0, txID.length()/2));
	txList.add(txID.substring(txID.length()/2));
	
	String value = String.format("%,d", Integer.parseInt(chainVO.getValue()));
	

      out.write("\r\n");
      out.write("\t<div class=\"container\" style=\"position: relative;\">\r\n");
      out.write("\t\t<div id=\"download_Tx\" align=\"center\" style=\"width: 1400px;\">\r\n");
      out.write("\t\t\t<img src=\"../FTBC_Images/Certificate.png\">\r\n");
      out.write("\t\t\t<div class=\"tx_info\"\r\n");
      out.write("\t\t\t\tstyle=\"width: auto; bottom: 480px; position: absolute; text-align: center\">\r\n");
      out.write("\t\t\t\t<div id=\"d_tx_id\">\r\n");
      out.write("\t\t\t\t\t<span style=\"vertical-align: top; display: inline-block;width: 185px;\">?????? ?????? :</span> \r\n");
      out.write("\t\t\t\t\t<span id=\"tx_id\" style=\"display: inline-block; text-align: left;\">");
      out.print(txList.get(0));
      out.write("<br>");
      out.print(txList.get(1));
      out.write("</span>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<div id=\"tx_contents\">\r\n");
      out.write("\t\t\t\t\t<div class=\"d_tx_content\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"span_list\">???????????? ?????? :</span> <span\r\n");
      out.write("\t\t\t\t\t\t\tid=\"tx_project_name\">");
      out.print(chainVO.getPjo_longtitle());
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"d_tx_content\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"span_list\">???????????? ?????? :</span> <span\r\n");
      out.write("\t\t\t\t\t\t\tid=\"tx_project_code\">");
      out.print(chainVO.getProject_code());
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"d_tx_content\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"span_list\">?????????&nbsp;&nbsp; ?????? :</span> <span\r\n");
      out.write("\t\t\t\t\t\t\tid=\"tx_recipient_name\">");
      out.print(chainVO.getCreator_name());
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"d_tx_content\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"span_list\">?????????&nbsp;&nbsp; ?????? :</span> <span\r\n");
      out.write("\t\t\t\t\t\t\tid=\"tx_sender_name\">");
      out.print(chainVO.getDonator_name());
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"d_tx_content\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"span_list\">??????&nbsp;&nbsp;&nbsp;&nbsp; ?????? :</span> <span\r\n");
      out.write("\t\t\t\t\t\t\tid=\"tx_value\">");
      out.print(value);
      out.write(" ???</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"d_tx_content\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"span_list\">???????????? ?????? :</span> \r\n");
      out.write("\t\t\t\t\t\t<span id=\"tx_gift_code\">");
      out.print(chainVO.getGift_code() );
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"d_tx_content\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"span_list\">???????????? ?????? :</span> \r\n");
      out.write("\t\t\t\t\t\t<span id=\"tx_timestamp\">");
      out.print(chainVO.getTimeStamp());
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"d_tx_content\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"span_list\" style=\"vertical-align: top;\">???????????? ?????? :</span> \r\n");
      out.write("\t\t\t\t\t\t<span id=\"tx_block_hash\" style=\"display: inline-block;text-align: left;\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(hashList.get(0));
      out.write("<br>");
      out.print(hashList.get(1) );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<button id=\"saveTX\">????????????</button>\r\n");
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
