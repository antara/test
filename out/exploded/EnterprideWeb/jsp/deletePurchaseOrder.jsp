<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: Mar 2, 2012
  Time: 10:48:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/_taglibInclude.jsp" %>
<link rel="stylesheet" href="/css/general.css" type="text/css" media="screen" />
<s:useActionBean beanclass="com.erp.action.PurchaseOrderActionBean" var="listofPO" event="deletePOLink"></s:useActionBean>
<% request.setAttribute("purchaseorderlst",listofPO.getPurchaseorderlst());

%>
<s:layout-render name="/layout/_base.jsp">
      <s:layout-component name="body">
          <s:form beanclass="com.erp.action.PurchaseOrderActionBean">
   <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr valign="top"><td >&nbsp;
 </td></tr>
 <tr><td align="left" class="pageheading" valign="top">
Purchase Order > Delete Purchase Order
 </td></tr>
 <tr valign="top"><td align="center">&nbsp;
 </td></tr>
 </table>
              <table width="100%"><tr><td>
                    <d:table name="purchaseorderlst" id="purchaseorder1" pagesize="10" class="disp" requestURI="/PurchaseOrder.action">
                 <d:column property="vendor.name" title="Name of the supplier"/>
                 <d:column property="purchaseOrderNo" title="Order No"  />
                  <d:column property="createDate" title="Date"  />      
                 <d:column title="Delete" class="delete">

                                     <s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="delete" >
                                        <s:param name="id" value="${purchaseorder1.id}"></s:param>
                                    <img src="/images/Close-2-icon.png" />   </s:link>

                                </d:column>

             </d:table></td></tr></table>

 </s:form></s:layout-component></s:layout-render>