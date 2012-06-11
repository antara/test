<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<script src="javascript/jquery.js" type="text/javascript"></script>
<%@ include file="/includes/_taglibInclude.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
      <title>render page main</title>
     <script type="text/javascript">
function MakeArrayday(size) {
this.length = size;
for(var i = 1; i <= size; i++) {
this[i] = "";
}
return this;
}
function MakeArraymonth(size) {
this.length = size;
for(var i = 1; i <= size; i++) {
this[i] = "";
}
return this;
}
function funClock() {
var runTime = new Date();
var hours = runTime.getHours();
var minutes = runTime.getMinutes();
var seconds = runTime.getSeconds();
var dn = "AM";

if (hours >= 12) {

	dn = "PM";
hours = hours - 12;
}
if (hours == 0) {
hours = 12;
}
if (minutes <= 9) {
minutes = "0" + minutes;
}
if (seconds <= 9) {
seconds = "0" + seconds;
}
movingtime = ""+ hours + ":" + minutes + ":" + seconds + " " + dn + "";

document.getElementById("clock").innerHTML = movingtime;
setTimeout("funClock()", 1000);
}
setTimeout("funClock()", 100);
</script>
  </head>
  <body >

  <s:layout-definition>
   <table width="100%" height="100%" border="0" align="center"  style="background-color:#FCFCFC;">
  <tr >
     <td height="30" colspan="2" align="right"><s:layout-component name="header"><div align="right" style="margin-right: 5px;color:black;font-size:10px;font-family:sans-serif; font-weight: bold;">WELCOME  <a href="jsp/login.jsp" class="links" style="font-size:11px;">  (Logout)</a></div>
    <div align="right" style="margin-right:5px;color:black;" class="labels">
                			<%	Date date = Calendar.getInstance().getTime();
                                DateFormat formatter = new SimpleDateFormat("dd MMMM, yyyy");
                            %>
                    	    <%= formatter.format(date) %>
                            <input type="hidden" name="inDate1" id="inDate1" value="<%= formatter.format(date) %>"/>
                            <span id="clock" style="position:relative;"></span>
                        </div>
    </s:layout-component></td>
      </tr>
  <tr style="background: url(/images/navigation2_product_bottom.png) center center repeat-x;">
    <td height="20" colspan="2"> <s:layout-component name="menu">
         <div class="menu">

<ul>
    <li><a class="hide" href="#">Item Management</a>

<!--[if lte IE 6]>
<a href="../layouts/index.html">LAYOUTS
<table><tr><td>
<![endif]-->

	<ul>
	<li><s:link beanclass="com.erp.action.ItemActionBean" event="pagedirect">Add</s:link></li>
	<li><s:link beanclass="com.erp.action.ItemActionBean" event="updateitemlink">Update</s:link></li>
	<li><s:link beanclass="com.erp.action.ItemActionBean" event="deleteitemlink">Delete</s:link></li>

	</ul>

<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->

</li>

<li><a class="hide" href="#">Vendor Management</a>

<!--[if lte IE 6]>
<a href="../boxes/index.html">BOXES
<table><tr><td>
<![endif]-->

	<ul>
	<li><s:link beanclass="com.erp.action.VendorActionBean" event="addVendorLink">Add</s:link></li>
	<li><s:link beanclass="com.erp.action.VendorActionBean" event="UpdateVendorLink">Update</s:link></li>
	<li><s:link beanclass="com.erp.action.VendorActionBean" event="deleteVendorLink">Delete</s:link></li>
	
	<li><s:link beanclass="com.erp.action.VendorActionBean" event="historyVendorLink">History</s:link></li>

	</ul>

<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->

</li>


<li><a class="hide" href="#">Stock</a>

<!--[if lte IE 6]>
<a href="index.html">MENUS
<table><tr><td>
<![endif]-->

	<ul>
	<li><a  href="#" >GRN &gt;</a>

    <!--[if lte IE 6]>
    <a class="sub" href="../menu/hover_click.html" title="Hover/click with no active/focus borders">HOVER/CLICK &gt;
    <table><tr><td>
    <![endif]-->

		<ul>
			<li><s:link beanclass="com.erp.action.GrnActionBean" event="addGrnLink">Add</s:link></li>
			<li><s:link beanclass="com.erp.action.GrnActionBean" event="updateGrnLink">Update</s:link></li>

		</ul>

	<!--[if lte IE 6]>
	</td></tr></table>
    </a>
    <![endif]-->

	</li>
	<li><a href="#" >Material Requisition &gt;</a><ul>
			<li><s:link beanclass="com.erp.action.RequisitionActionBean" event="addRequisitionLink" title="Add Material Requisition">Add</s:link></li>
			<li><s:link beanclass="com.erp.action.RequisitionActionBean" event="updateRequisitionLink">Update</s:link></li>

		</ul></li>
	 <li><s:link beanclass="com.erp.action.StoreIssueActionBean" event="addStoreIssueLink">Issue</s:link><%--<ul>
        <li><s:link beanclass="com.erp.action.StoreIssueActionBean" event="addStoreIssueLink">Add</s:link></li>
                         <li><s:link beanclass="com.erp.action.StoreIssueActionBean" event="updateStoreIssueLink">Update</s:link></li>
			

		</ul>--%></li>

	</ul>

<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->

</li>

  <li><a class="hide" href="../menu/index.html">Purchase Order</a>

<!--[if lte IE 6]>
<a href="../menu/index.html">DEMOS
<table><tr><td>
<![endif]-->

	<ul>
<li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="addPOLink">Add</s:link></li>
	  <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="generatePurchaseOrderLink">Generate</s:link></li>
	<li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="deletePOLink">Delete</s:link></li>




	</ul>

<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->

</li>

<li><a class="hide" href="../mozilla/index.html">Report</a>

<!--[if lte IE 6]>
<a href="../mozilla/index.html">MOZILLA
<table><tr><td>
<![endif]-->



<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->

</li>

<li><a class="hide" href="../ie/index.html">Search</a>

<!--[if lte IE 6]>
<a href="../ie/index.html">EXPLORER
<table><tr><td>
<![endif]-->



<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->

</li>
<li><a class="hide" href="#">User Management</a>
    <ul>
        <li><s:link beanclass="com.erp.action.UserActionBean" event="addUserLink">Add</s:link></li>
            <li><s:link beanclass="com.erp.action.UserActionBean" event="updateUserLink">Update</s:link></li>
            <li><s:link beanclass="com.erp.action.UserActionBean" event="deleteUserLink">Delete</s:link></li>
			  <li><s:link beanclass="com.erp.action.UserActionBean" event="UserPermissionLink">User Permission</s:link></li>
	    </ul>
	</li>
	</ul>

<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->
</li>
</ul>
</div>
<%--<p id="iepara">Rest of content here</p>--%>
      </s:layout-component></td>
  </tr>
 <tr >
    <%--<td width="15%" height="432">${left_menu}</td>--%>
    <td valign="top">   <s:layout-component name="body"></s:layout-component></td>
  </tr>
  <tr >
    <td height="30" colspan="2"><s:layout-component name="footer"></s:layout-component></td>
  </tr>
</table>
</s:layout-definition>
  </body>
</html>