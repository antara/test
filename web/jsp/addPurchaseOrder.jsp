<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: Feb 29, 2012
  Time: 5:26:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/_taglibInclude.jsp" %>
<link rel="stylesheet" href="/css/general.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/stylesheet.css"/>
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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:useActionBean beanclass="com.erp.action.PurchaseOrderActionBean" var="listoforder" event="addPOLink"></s:useActionBean>
<% request.setAttribute("vendorlst",listoforder.getVendorlst());
    request.setAttribute("itemidlst",listoforder.getItemidlst());
%>
<s:layout-render name="/layout/_base.jsp">
      <s:layout-component name="body">
       <s:form beanclass="com.erp.action.PurchaseOrderActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr valign="top"><td >&nbsp;
 </td></tr>
 <tr><td align="left" class="pageheading" valign="top">
Purchase Order > Add Order
 </td></tr>
 <tr valign="top"><td align="center">&nbsp;
 </td></tr>
 </table>
 <table border="1" width="78%" bgcolor="#FCFCFC" ><tr><td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
       <td width="16%" align="left" valign="top">
         <div align="left" style="margin-left: 2px;" class="labels">
           <div align="right">Name of Supplier<span style="color:#FF0000"> *</span></div>
         </div></td>
	<td width="21%" align="left" valign="top"><div align="left">
        <s:select id="vendorName" name="purchaseOrder.vendor.id" class="dropdown">
                        <option  value="0">---Select Vendor---</option>
              <c:forEach items="${vendorlst}" var="vendor" varStatus="loop" >



               <option value ="${vendor.id}"><c:out value="${vendor.name}"/></option>


		      </c:forEach>

                </s:select>

	  </div></td>
          <td width="15%">&nbsp;<s:hidden name="purchaseOrder.deleted" value="1"/></td>
        <td width="15%">&nbsp;</td>
        <td width="48%">&nbsp;</td>
      </tr>

    <%--  <tr>
         <td width="16%" align="left" valign="top">
           <div align="left" style="margin-left: 15px;" class="labels">
             <div align="right">Purchase Order No</div>
          </div></td>
       <td valign="top"><div align="left">
        <s:text name="purchaseOrder.purchaseOrderNo" class="textbox"></s:text>
       </div></td>

      </tr>--%>

      

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
                              <c:forEach var="i" begin="1" end="4" step="1" varStatus ="status" >


					      <tr id="tabletr">
					        <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					          <div align="right">
                                   <s:select id="itemcode" name="purchasedetailarray[${i}].item.id"  onchange= "return GetItemDetail(this);">
                        <option  value="0">---Select Item---</option>
              <c:forEach items="${itemidlst}" var="itemidloop" varStatus="loop" >



               <option value ="${itemidloop}"><c:out value="${itemidloop}"/></option>


		      </c:forEach>

                </s:select>
					         <%--   <s:text name="grndetailarray[${i}].item.id"  style="text-align:right;margin-right:2px;width:100px; "  />--%>
					          </div></div></td>
					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">
					         <div align="right">
					           <s:text type="text" name="purchasedetail.itemName" id="item${i}" class="hello" style="text-align:right;margin-right:2px; width:200px; "  />
					         </div></div></td>
					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					           <s:text  name="purchasedetail.uom" id="uom${i}" style="text-align:right;margin-right:2px;width:100px; "/>
					         </div></div></td>
                               <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					            <s:text  name="purchasedetailarray[${i}].description" style="text-align:right;margin-right:2px;width:100px; "/>
					         </div></div></td>
                               <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					             <s:text  name="purchasedetailarray[${i}].orderedQty"  style="text-align:right;margin-right:2px;width:100px; "/>
					         </div></div></td>
                               <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
                               <s:text  name="purchasedetailarray[${i}].rate"  style="text-align:right;margin-right:2px;width:70px; "/>
					         </div></div></td>
					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
                                <s:text  name="purchasedetailarray[${i}].amount"  style="text-align:right;margin-right:2px;width:70px; "/>
					         </div></div></td>
					         <%--<td style="border-top:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
					              <s:text  name="purchasedetailarray[${i}].remark"  style="text-align:right;margin-right:2px;width:100px; "/>
					        </div></div></td>--%>
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
	<s:submit name="addPurchaseOrder" value="Preview"></s:submit>

        &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="reset"  value="Reset" name="reset"  style="width:80px" />
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <s:submit name="cancel" value="Cancel"></s:submit>
	  </div></td>
	<td width="3%" align="left">&nbsp;</td>
	</tr>
    </table></td></tr></table>
    </s:form>
      </s:layout-component>
</s:layout-render>
