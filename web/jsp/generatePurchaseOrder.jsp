<%--
  Created by IntelliJ IDEA.
  User: Milind
  Date: Mar 7, 2012
  Time: 11:57:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/_taglibInclude.jsp" %>
<link rel="stylesheet" href="/css/general.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/stylesheet.css"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/css/general.css" type="text/css" media="screen" />
 <script type="text/javascript">
           function GetItemDetail(button) {
                   var rowid=button.name.substring(button.name.indexOf("[")+1,button.name.indexOf("]"));
        $.post('PurchaseOrder.action?getItemDetails', {id:button.value}, function (data) {
        var result=eval(data);
        $('#item'+rowid+'').attr("value",result.name);
        $('#uom'+rowid+'').attr("value",result.uom.name);
    });
    return false;
    }
           $(document).ready(function(){
               $('#add').click(function(){
                          var count=$('#family #tabletr').length+1;
                          $('#family #tabletr:last').clone(true).insertAfter('#family #tabletr:last');
                          $('#family #tabletr:last input').removeAttr("value");
                          $('#family #tabletr:last select:eq(0)').attr("name","purchasedetailarray["+count+"].item.id");
                          $('#family #tabletr:last input:eq(0)').attr("id","item"+count);
                          $('#family #tabletr:last input:eq(1)').attr("id","uom"+count);
                          $('#family #tabletr:last input:eq(2)').attr("name","purchasedetailarray["+count+"].description");
                          $('#family #tabletr:last input:eq(3)').attr("name","purchasedetailarray["+count+"].orderedQty");
                          $('#family #tabletr:last input:eq(4)').attr("name","purchasedetailarray["+count+"].rate");
                          $('#family #tabletr:last input:eq(5)').attr("name","purchasedetailarray["+count+"].amount");
                            });
                         });
       </script>
<s:useActionBean beanclass="com.erp.action.PurchaseOrderActionBean" var="listofpo" event="generateUpdatePOLink"></s:useActionBean>
<% request.setAttribute("purchaseorderlst",listofpo.getPurchaseorderlst());
    request.setAttribute("vendorlst",listofpo.getVendorlst());
    request.setAttribute("itemidlst",listofpo.getItemidlst());
    request.setAttribute("purchaseOrder",listofpo.getPurchaseOrder());
    request.setAttribute("purchaseOrderLst",listofpo.getAllPurchaseOrderNo());

%>
<s:layout-render name="/layout/_base.jsp">
<s:layout-component name="body">


    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr valign="top"><td >&nbsp;
 </td></tr>
 <tr><td align="left" class="pageheading" valign="top">
Purchase Order > Generate
 </td></tr>
 <tr valign="top"><td align="center">&nbsp;
 </td></tr>
 </table>
          <s:form beanclass="com.erp.action.PurchaseOrderActionBean">

 <table width="50%" border="0"><tr><td width="35%" align="left" valign="top">
   <div align="right" style="margin-left: 1px;" class="labels">Please Select Purchase Order No  <span style="color:#FF0000"> *</span></div></td>
		  <td width="39%" align="left" valign="top" >

<s:select id="vendorName" name="id" class="dropdown">
                        <option  value="0">---Select PO No---</option>
              <c:forEach items="${purchaseorderlst}" var="purchaseorderlst" varStatus="loop" >
                    <c:choose>
                  <c:when test="${actionBean.purchaseOrder.purchaseOrderNo eq purchaseorderlst.purchaseOrderNo}">
			            <option value ="<c:out value="${actionBean.purchaseOrder.id}"/>" selected="selected"> <c:out value="${actionBean.purchaseOrder.purchaseOrderNo}"/></option>
                  </c:when>

                <c:otherwise>
               <option value ="${purchaseorderlst.id}"><c:out value="${purchaseorderlst.purchaseOrderNo}"/></option>
                  </c:otherwise>
                  </c:choose>
				<%--<option value ="<c:out value="${vendor.vendorName}"/>"><c:out value="${vendor.vendorName}"/></option>--%>

		      </c:forEach>

                </s:select>

	        </td>
              <td width="15%">&nbsp;<s:hidden name="purchaseOrder.deleted" value="1"/></td>
		  <td width="26%" align="left" valign="top" > <s:submit name="getToGenaratePurchaseOrder"  value="Get"/></td>
						</tr></table>
           </s:form>
           <c:if test="${actionBean.purchaseOrder!=null}">
        <s:form beanclass="com.erp.action.PurchaseOrderActionBean">
     <table border="1" width="78%" bgcolor="#FCFCFC" ><tr><td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr>
       <td width="16%" align="left" valign="top">
         <div align="left" style="margin-left: 2px;" class="labels">
           <div align="right">Name of Supplier<span style="color:#FF0000"> *</span></div>
         </div></td>
	<td width="21%" align="left" valign="top"><div align="left">

			            ${purchaseOrder.vendor.name}


	  </div></td>
        <td width="15%">&nbsp;<s:hidden name="purchaseOrder.deleted" value="1"/></td>
        <td width="48%">&nbsp;<s:hidden id="purchaseOrderid" name="purchaseOrder.id" class="textbox"></s:hidden></td>
         <td width="15%">&nbsp;<s:hidden name="purchaseOrder.generatedPO"/></td>
     <td width="15%">&nbsp;<s:hidden name="id"/></td>

      <tr>
         <td width="16%" align="left" valign="top">
           <div align="left" style="margin-left: 15px;" class="labels">
             <div align="right">Purchase Order No</div>
          </div></td>
       <td valign="top"><div align="left">
      ${purchaseOrder.purchaseOrderNo}
       </div></td>

      </tr>



      <tr>
        <td colspan="4"><br><div align="left" style="margin-left:10px;">
				<table width="95%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;" align="left" id="family">
					<tr>
						<td width="14%" height="28px" style="border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;" >Item Code</span></strong></div></td>
					    <td width="22%"  style="border-right:1px solid #000000; background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Item name</span></strong></div></td>
					    <td width="9%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Uom</span></strong></div></td>
					    <td width="12%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Description</span></strong></div></td>
					    <td width="13%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Orderered Quantity</span></strong></div></td>
                          <td width="12%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Rate</span></strong></div></td>
					    <td width="5%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Amount</span></strong></div></td>

					  </tr>
                              <c:forEach items="${purchaseOrder.purchasedetailarray}" var="purchasedetailarray" varStatus="loop" >


<tr id="tabletr">
					        <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					          <div align="right">


			           ${purchasedetailarray.item.id}



					          </div></div></td>
					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">
					         <div align="right">
					           ${purchasedetailarray.item.name}
					         </div></div></td>
					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					        ${purchasedetailarray.item.uom.name}
					         </div></div></td>
                               <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					          ${purchasedetailarray.description}
					         </div></div></td>
                               <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					             ${purchasedetailarray.orderedQty}
					         </div></div></td>

					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
                               ${purchasedetailarray.rate}
					         </div></div></td>
					         <td style="border-top:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
					              ${purchasedetailarray.amount}
					        </div></div></td>
					     </tr>             </c:forEach>
				</table>

				</div></td>
      </tr>
      <tr>
        <td align="left">&nbsp;</td>
        <td align="left" colspan="3">&nbsp;</td>
        <td align="left">&nbsp;</td>
      </tr>
      <tr>
	<td align="left">&nbsp;</td>
	<td align="left" colspan="3"><div align="left" style="margin-left:20px"> &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;
	    <s:submit name="generatePurchaseOrder" value="Generate PO"></s:submit>
        &nbsp;&nbsp;&nbsp;&nbsp;

        <s:submit name="generateUpdatePOLink" value="Edit"></s:submit>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <s:submit name="cancel" value="Cancel"></s:submit>
	  </div></td>
	<td width="3%" align="left">&nbsp;</td>
	</tr>
    </table></td></tr></table></s:form>
               </c:if>
 </s:layout-component>
    </s:layout-render>
