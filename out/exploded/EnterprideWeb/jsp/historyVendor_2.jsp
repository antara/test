
<%@ include file="/includes/_taglibInclude.jsp" %>
<link rel="stylesheet" href="/css/general.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/stylesheet.css"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">
     $(document).ready(function() {
     $('#radio1').click(function() {
         $('#myDiv2').hide();
         $('#table').hide();
         $('#po').val("");
 $('#myDiv').toggle();
 });
   $('#radio2').click(function() {
       $('#myDiv').hide();
       $('#city').val("");
       $('#table').hide();
 $('#myDiv2').toggle();
 });
     });
</script>
 <s:useActionBean beanclass="com.erp.action.VendorActionBean" var="listofvendor" event="history"></s:useActionBean>
<%
    request.setAttribute("vendorlst",listofvendor.getVendorlst());
%>
<s:layout-render name="/layout/_base.jsp">
      <s:layout-component name="body">

         <s:form beanclass="com.erp.action.VendorActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr valign="top"><td >&nbsp;
 </td></tr>
 <tr><td align="left" class="pageheading" valign="top">
Vendor History > <strong>Search Vendor</strong>
 </td></tr>
 <tr valign="top"><td align="center">&nbsp;
 </td></tr>
 </table>
<table width="66%" border="1" bordercolor="#FF6600">
<tr><td>
    <table width="66%" border="0" >

      <tr>
        <td  align="left" valign="top">Search By</td>



        <td width="6%" align="right" valign="top"><s:radio  value="name" id="radio1"  name="search"></s:radio></td>
        <td width="21%" align="left" valign="top">Vendor Name</td>
        <td width="6%" align="right" valign="top"><s:radio  id="radio2" value="po" name="search"></s:radio></td>
        <td width="47%" align="left" valign="top">PO</td>
      </tr>
        <tr>
            <td></td>
            <td align="center" colspan="4">

                 <c:if test="${actionBean.vendorlst!=null}">
                     <c:choose>
                <c:when test="${actionBean.search eq 'name'}">

                          <div id="myDiv"  align="left" style="margin-left: 2px;" class="labels">Enter Name<span style=" color:#FF0000"> * </span><s:text id="city" name="vendor.name"/><s:submit name="history" value="Get"></s:submit></div>

                </c:when>

                 <c:otherwise>
                      <c:if test="${actionBean.search eq 'po'}">
                               <div id="myDiv2" align="left" style="margin-left: 2px;" class="labels">Enter PO<span style="color:#FF0000"> * </span><s:text id="po" name="vendor.name"/><s:submit name="history" value="Get" ></s:submit></div>

                           </c:if>


                 </c:otherwise>
                    </c:choose>
                  </c:if>

                <div id="myDiv" style="display:none;" align="left" style="margin-left: 2px;" class="labels">Enter Name<span style=" color:#FF0000"> * </span><s:text id="city" name="vendor.name"/><s:submit name="history" value="Get"></s:submit></div>
                <div id="myDiv2" style="display:none;" align="left" style="margin-left: 2px;" class="labels">Enter PO<span style="color:#FF0000"> * </span><s:text id="po" name="vendor.name"/><s:submit name="history" value="Get" ></s:submit></div>
            </td>

        </tr>
    </table>
    </td>
    </tr>
    </table>

                        <c:if test="${actionBean.vendorlst!=null}">

                     <table id="table" width="100%"><tr><td>

                    <d:table name="vendorlst" id="vendor1" pagesize="10" class="disp" requestURI="/Vendor.action">
                 <d:column property="name" title="Vendor Name"/>
                 <d:column property="address" title="Vendor Address"  />
                  <d:column property="emailId" title="Email Id" />
                        <d:column property="phoneNo" title="Phone Number" />
                <d:column property="productSupplied" title="Product Supplied" />


             </d:table></td></tr></table>


           </c:if>
          </s:form>
      </s:layout-component>
</s:layout-render>
