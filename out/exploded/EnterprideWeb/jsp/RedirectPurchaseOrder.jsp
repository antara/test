<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: Mar 13, 2012
  Time: 10:01:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/_taglibInclude.jsp" %>

<link rel="stylesheet" href="/css/general.css" type="text/css" media="screen" />
    <script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="/js/popup.js" type="text/javascript"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <script type="text/javascript">
    function OpenPopup(){
	var w = 750;
	var h = 450;
	var winl = (screen.width-w)/2;
	var wint = (screen.height-h)/2;
	if (winl < 0) winl = 0;
	if (wint < 0) wint = 0;
	var page = "/jsp/previewPurchaseOrder.jsp";
	windowprops = "height="+h+",width="+w+",top="+ wint +",left="+ winl +",location=no,"
	+ "scrollbars=yes,menubars=no,toolbars=no,resizable=no,status=yes";
	window.open(page, "Popup", windowprops);
}
	window.onLoad =OpenPopup();   
   </script>

<form name="PurchaseOrderActionBean" id="frmredirector">
<input type="hidden" name="myname" id="myname" value="searchpage">
</form>
<script type="text/javascript" language="javascript">
	document.frmredirector.submit();
</script>