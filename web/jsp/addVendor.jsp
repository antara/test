<%--
  Created by IntelliJ IDEA.
  User: Minal
  Date: Feb 17, 2012
  Time: 4:28:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/_taglibInclude.jsp" %>
<link rel="stylesheet" href="/css/general.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/stylesheet.css"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:layout-render name="/layout/_base.jsp">
      <s:layout-component name="body">
       <s:form beanclass="com.erp.action.VendorActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr valign="top"><td >&nbsp;
 </td></tr>
 <tr><td align="left" class="pageheading" valign="top">
Vendor Management > Add Vendor
 </td></tr>
 <tr valign="top"><td align="center">&nbsp;
 </td></tr>
 </table>
 <table border="1" width="66%" bgcolor="#FCFCFC" ><tr><td>
<table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC">
  <tr>
    <td align="left"  valign="top" colspan="2"><div align="left" class="labels" style="margin-left:2px"><span style="border-bottom-color:#000">Vendor</span></div></td>

    <td align="left" valign="top" colspan="2"><div align="left" class="labels" style="margin-left:2px">Product Supplied</div></td>

  </tr>
  <tr>
   <td width="11%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Name<span style="color:#FF0000"> *</span></div>     </td>
    <td width="33%" align="left" valign="top"><div align="left"><s:text name="vendor.name" class="textbox"></s:text></div> </td>
    <td width="18%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Product Name<span style="color:#FF0000"> *</span></div></td>

    <td width="34%" align="left" valign="bottom"><div align="left" ><s:text   name="vendor.productSupplied" class="textbox"></s:text>
      <s:hidden name="vendor.deleted" value="1"/>
    </div></td>


  <tr>
    <td align="left" valign="top" colspan="2" class="labels">Contact Details</td>
    <td align="left" valign="top" class="labels">Bank Details</td>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Address<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.address" class="textbox"></s:text></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Account Name</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.accountName" class="textbox"></s:text></div></td>
  </tr>
  <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Phone No<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.phoneNo" class="textbox"></s:text></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Account No</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.accountNo" class="textbox"></s:text></div></td>
  </tr>
  <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Email Id<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.emailId" class="textbox"></s:text></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Bank</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.bank" class="textbox"></s:text></div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Branch</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.branch" class="textbox"></s:text></div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">IFSC Code</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.ifscCode" class="textbox"></s:text></div></td>
  </tr>
  <tr>
    <td >&nbsp;</td>
    <td colspan="2" align="right" valign="top"><div align="center"><s:submit name="addVendor" value="Add"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;
    <s:reset name="reset" value="Reset"></s:reset>   &nbsp;&nbsp;&nbsp;&nbsp;
        <s:submit name="cancel" value="Cancel"></s:submit></div></td>
   <td >&nbsp;</td>

  </tr>
</table></td></tr></table>
    </s:form>
      </s:layout-component>
</s:layout-render>
