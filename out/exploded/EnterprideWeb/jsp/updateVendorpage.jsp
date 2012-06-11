<%@ include file="/includes/_taglibInclude.jsp" %>
<link rel="stylesheet" href="/css/general.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/stylesheet.css"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:useActionBean beanclass="com.erp.action.VendorActionBean" var="listofvendor" event="deleteVendorLink"></s:useActionBean>
<% request.setAttribute("vendorlst",listofvendor.getVendorlst());
%>
<s:layout-render name="/layout/_base.jsp">
      <s:layout-component name="body">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr valign="top"><td >&nbsp;
 </td></tr>
 <tr><td align="left" class="pageheading" valign="top">
Vendor Management > Update Vendor
 </td></tr>
 <tr valign="top"><td align="center">&nbsp;
 </td></tr>
 </table>
 <s:form beanclass="com.erp.action.VendorActionBean">
 <table width="50%" border="0"><tr><td width="34%" align="left" valign="top">
   <div align="right" style="margin-left: 1px;" class="labels">Please select Vendor Name<span style="color:#FF0000"> *</span></div></td>
		  <td width="36%" align="left" valign="top" >
<s:select id="vendorName" name="id" class="dropdown">
                        <option  value="0">---Select Vender---</option>
              <c:forEach items="${vendorlst}" var="vendor" varStatus="loop" >
                    <c:choose>
                  <c:when test="${actionBean.vendor.name eq vendor.name}">
			            <option value ="<c:out value="${actionBean.vendor.id}"/>" selected="selected"> <c:out value="${actionBean.vendor.name}"/></option>
                  </c:when>
                  <c:otherwise>
               <option value ="${vendor.id}"><c:out value="${vendor.name}"/></option>
                  </c:otherwise>
                  </c:choose>
		      </c:forEach>
           </s:select>
	        </td>
		  <td width="30%" align="left" valign="top" > <s:submit name="updateVendor"  value="Get"/></td>
						</tr></table>
           </s:form>
              <c:if test="${actionBean.vendor!=null}">
                  <s:form beanclass="com.erp.action.VendorActionBean">

 <table border="1" width="66%" bgcolor="#FCFCFC" ><tr><td>
<table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC">
  <tr>
    <td align="left"  valign="top" colspan="2"><div align="left" class="labels" style="margin-left:2px"><span style="border-bottom-color:#000">Vendor</span></div></td>
    <td align="left" valign="top" colspan="2"><div align="left" class="labels" style="margin-left:2px">Product Supplied</div></td>
  </tr>
  <tr>
   <td width="11%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Name<span style="color:#FF0000"> *</span></div>     </td>
    <td width="33%" align="left" valign="top"><div align="left"><s:text name="vendor.name" class="textbox"></s:text></div><s:hidden id="updatevendorid" name="id" class="textbox"></s:hidden></td>
    <td width="18%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Product Name<span style="color:#FF0000"> *</span></div></td>
     <td width="34%" align="left" valign="bottom"><div align="left" ><s:text   name="vendor.productSupplied" class="textbox"></s:text></div></td>
 </tr>

  <tr>
    <td align="left" valign="top" colspan="2">Contact Details</td>
    <td align="left" valign="top">Bank Details</td>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Address<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.address" class="textbox"></s:text></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">A/C Name</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.accountName" class="textbox"></s:text></div></td>
  </tr>
  <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Phone No<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.phoneNo" class="textbox"></s:text></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">A/C No</div></td>
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
    <td colspan="2" align="right" valign="top"><div align="center"><s:submit name="update" value="Update"></s:submit>&nbsp;&nbsp;
    <s:reset name="reset" value="Reset"></s:reset>
        <s:submit name="cancel" value="Cancel"></s:submit></div></td>
   <td >&nbsp;</td>

  </tr>
</table></td></tr></table>
    </s:form>
          </c:if>
      </s:layout-component>
</s:layout-render>
