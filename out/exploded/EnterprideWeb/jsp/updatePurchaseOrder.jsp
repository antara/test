<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: Mar 1, 2012
  Time: 3:44:59 PM
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
<s:useActionBean beanclass="com.erp.action.PurchaseOrderActionBean" var="listofpo" event="updatePOLink"></s:useActionBean>
<% request.setAttribute("purchaseorderlst",listofpo.getPurchaseorderlst());
     request.setAttribute("purchaseOrder",listofpo.getPurchaseOrder());
    request.setAttribute("vendorlst",listofpo.getVendorlst());
    request.setAttribute("itemidlst",listofpo.getItemidlst());

%>

    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr valign="top"><td >&nbsp;
 </td></tr>
 <tr><td align="left" class="pageheading" valign="top">
Purchase Order > Update Purchase Order
 </td></tr>
 <tr valign="top"><td align="center">&nbsp;
 </td></tr>
 </table>
<%--
 <s:form beanclass="com.erp.action.PurchaseOrderActionBean">

 <table width="50%" border="0"><tr><td width="26%" align="left" valign="top">
   <div align="right" style="margin-left: 1px;" class="labels">Please select Purchase Order No<span style="color:#FF0000"> *</span></div></td>
		  <td width="40%" align="left" valign="top" >
<s:select name="id" id="purchasenumberdropdown" class="dropdown">
                        <option value="">---Select No---</option>
            <c:forEach items="${purchaseorderlst}" var="purchaseorderloop" varStatus="loop" >
                   <c:choose>
                  <c:when test="${actionBean.purchaseOrder.id eq purchaseorderloop.id}">
			            <option value ="<c:out value="${actionBean.purchaseOrder.id}"/>" selected="selected"> <c:out value="${actionBean.purchaseOrder.purchaseOrderNo}"/></option>
                  </c:when>
                  <c:otherwise>
              <option value ="<c:out value="${purchaseorderloop.id}"/>"> <c:out value="${purchaseorderloop.purchaseOrderNo}"/></option>
                </c:otherwise>
                  </c:choose>
		      </c:forEach>
                </s:select>
	        </td>
		  <td width="34%" align="left" valign="top" ><div align="left"> <s:submit name="getPOButton"  value="Get"/></div></td>
						</tr></table>  </s:form>
--%>
      <c:if test="${actionBean.purchaseOrder!=null}">    <s:form beanclass="com.erp.action.PurchaseOrderActionBean">
     <table border="1" width="78%" bgcolor="#FCFCFC" ><tr><td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
       <td width="16%" align="left" valign="top">
         <div align="left" style="margin-left: 2px;" class="labels">
           <div align="right">Name of Supplier<span style="color:#FF0000"> *</span></div>
         </div></td>
	<td width="21%" align="left" valign="top"><div align="left">
        <s:select id="vendorName" name="purchaseOrder.vendor.id" clauss="dropdown">
                        <option  value="0">---Select Vendor---</option>
              <c:forEach items="${vendorlst}" var="vendor" varStatus="loop" >
                   <c:choose>
                  <c:when test="${actionBean.purchaseOrder.vendor.id eq vendor.id}">
			            <option value ="<c:out value="${actionBean.purchaseOrder.vendor.id}"/>" selected="selected"> <c:out value="${actionBean.purchaseOrder.vendor.name}"/></option>
                  </c:when>

                  <c:otherwise>
              <option value ="${vendor.id}"><c:out value="${vendor.name}"/></option>
                </c:otherwise>
                  </c:choose>

		      </c:forEach>

                </s:select>

	  </div></td>
        <td width="15%">&nbsp;<s:hidden name="purchaseOrder.deleted" value="1"/></td>
        <td width="48%">&nbsp;<s:hidden id="purchaseOrderid" name="purchaseOrder.id" class="textbox"></s:hidden></td>
          <td width="48%">&nbsp;<s:hidden id="purchaseOrderno" name="purchaseOrder.purchaseOrderNo" class="textbox"></s:hidden></td>

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
                              <c:forEach items="${actionBean.purchaseOrder.purchasedetailarray}" var="purchasedetailarray" varStatus="loop" >


<tr id="tabletr">
					        <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					          <div align="right">
                                   <s:select id="itemcode" name="purchasedetailarray[${loop.index}].item.id"  onchange= "return GetItemDetail(this);">
                        <option  value="0">---Select Item---</option>
                                        <c:forEach items="${actionBean.itemidlst}" var="itemidloop" >
                    <c:choose>
                  <c:when test="${purchasedetailarray.item.id eq itemidloop}">
			            <option value ="<c:out value="${purchasedetailarray.item.id}"/>" selected="selected"> <c:out value="${purchasedetailarray.item.id}"/></option>
                  </c:when>

                  <c:otherwise>
                <option value ="${itemidloop}"><c:out value="${itemidloop}"/></option>
                  </c:otherwise>
                  </c:choose>


		      </c:forEach>

                </s:select>
					<%--               <c:set var="newIndex" value="${loop.index + 1}" scope="page"/>--%>
					          </div></div></td>
					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">
					         <div align="right">
					           <s:text type="text" name="purchasedetail.itemName" value="${purchasedetailarray.item.name}" id="item${loop.index}" class="hello" style="text-align:right;margin-right:2px; width:200px; "  />
					         </div></div></td>
					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					           <s:text  name="purchasedetail.uom" id="uom${loop.index}" value="${purchasedetailarray.item.uom.name}" style="text-align:right;margin-right:2px;width:100px; "/>
					         </div></div></td>
                               <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					            <s:text  name="purchasedetailarray[${loop.index}].description" value="${purchasedetailarray.description}" style="text-align:right;margin-right:2px;width:100px; "/>
					         </div></div></td>
                               <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					             <s:text  name="purchasedetailarray[${loop.index}].orderedQty" value="${purchasedetailarray.orderedQty}"  style="text-align:right;margin-right:2px;width:100px; "/>
					         </div></div></td>
                               
					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
                                <s:text  name="purchasedetailarray[${loop.index}].rate" value="${purchasedetailarray.rate}"    style="text-align:right;margin-right:2px;width:70px; "/>
					         </div></div></td>
					         <td style="border-top:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
					              <s:text  name="purchasedetailarray[${loop.index}].amount" value="${purchasedetailarray.amount}" style="text-align:right;margin-right:2px;width:100px; "/>
					        </div></div></td>
					     </tr>             </c:forEach>
				</table>
                  <tr><td colspan="4">
                        <div style="text-align:right; cursor: pointer;" class="links"><span style="vertical-align: top;text-align: left;font-size:medium; " class="addRow" id="add" >Add row</span></div>
                    </td></tr>
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
	<s:submit name="updatePurchaseOrder" value="Preview"></s:submit>
        &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="reset"  value="Reset" name="reset"  style="width:80px" />
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <s:submit name="cancel" value="Cancel"></s:submit>
	  </div></td>
	<td width="3%" align="left">&nbsp;</td>
	</tr>
    </table></td></tr></table></s:form>   </c:if>
          
