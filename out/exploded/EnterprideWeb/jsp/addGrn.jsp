<%--
  Created by IntelliJ IDEA.
  User: Minal
  Date: Feb 20, 2012
  Time: 3:55:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/_taglibInclude.jsp" %>
<link rel="stylesheet" href="/css/general.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/stylesheet.css"/>
       <script type="text/javascript">

           function GetItemDetail(button) {
                   
                   var rowid=button.name.substring(button.name.indexOf("[")+1,button.name.indexOf("]"));
        $.post('Grn.action?getItemDetails', {id:button.value}, function (data) {
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
            $('#family #tabletr:last select:eq(0)').attr("name","grndetailarray["+count+"].item.id");
            $('#family #tabletr:last input:eq(0)').attr("id","item"+count);
            $('#family #tabletr:last input:eq(1)').attr("id","uom"+count);
            $('#family #tabletr:last input:eq(2)').attr("name","grndetailarray["+count+"].challanQty");
            $('#family #tabletr:last input:eq(3)').attr("name","grndetailarray["+count+"].receivedQty");
            $('#family #tabletr:last input:eq(4)').attr("name","grndetailarray["+count+"].acceptedQty");
            $('#family #tabletr:last input:eq(5)').attr("name","grndetailarray["+count+"].value");
            $('#family #tabletr:last input:eq(6)').attr("name","grndetailarray["+count+"].remark");
        });
                               
           });



       </script>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:useActionBean beanclass="com.erp.action.GrnActionBean" var="listofvendor" event="addGrnLink"></s:useActionBean>
<% request.setAttribute("vendorlst",listofvendor.getVendorlst());
    request.setAttribute("itemidlst",listofvendor.getItemidlst());
     request.setAttribute("purchaseorderlst",listofvendor.getPurchaseorderlst());
%>
<s:layout-render name="/layout/_base.jsp">
      <s:layout-component name="body">
       <s:form beanclass="com.erp.action.GrnActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr valign="top"><td >&nbsp;
 </td></tr>
 <tr><td align="left" class="pageheading" valign="top">
Stock Management > Add Grn
 </td></tr>
 <tr valign="top"><td align="center">&nbsp;
 </td></tr>
 </table>
 <table border="1" width="78%" bgcolor="#FCFCFC" ><tr><td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
       <td width="16%" align="left" valign="top">
         <div align="left" style="margin-left: 2px;" class="labels">
           <div align="right">Purchase Order<span style="color:#FF0000"> *</span></div>
         </div></td>
	<td width="21%" align="left" valign="top"><div align="left">
        <s:select  name="iddrop" class="dropdown">
                        <option  value="0">---Select Purchase Order---</option>
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

	  </div></td>
        <td width="15%"><s:submit name="getorderlstforgrn"  value="Get"/></td>
        <td width="48%">&nbsp;</td>
      </tr>
    </s:form>
         <c:if test="${actionBean.purchaseOrder!=null}">
              <s:form beanclass="com.erp.action.GrnActionBean">
      <tr>
         <td width="16%" align="left" valign="top">
           <div align="left" style="margin-left: 15px;" class="labels">
             <div align="right">Vendor Name</div>
          </div></td>
       <td valign="top"><div align="left">
        <s:text name="gr" value="${actionBean.purchaseOrder.vendor.name}" readonly="readonly" class="textbox"></s:text>
         <s:hidden  name="grn.purchaseOrder.id" value="${actionBean.purchaseOrder.id}" class="textbox"></s:hidden>
       </div></td>
        <td>	<div align="left" style="margin-left: 15px;" class="labels">
          <div align="right">Order Date</div>
        </div></td>
       <td valign="top"><div align="left">
       <s:text name="grn.orderDate" readonly="readonly" onFocus="showCalendarControl(this);" class="textbox"></s:text>
       </div></td>
      </tr>

      <tr>
         <td width="16%" align="left" valign="top">
           <div align="left" style="margin-left: 15px;" class="labels">
             <div align="right">Challan No</div>
          </div></td>
       <td valign="top"><div align="left">
        <s:text name="grn.challanNo" class="textbox"></s:text>
       </div></td>
        <td>	<div align="left" style="margin-left: 15px;" class="labels">
          <div align="right">Challan Date</div>
        </div></td>
       <td valign="top"><div align="left">
         <s:text name="grn.challanDate" readonly="readonly" onFocus="showCalendarControl(this);" class="textbox"></s:text>
       </div></td>
      </tr>

     <tr>
         <td width="16%" align="left" valign="top">
           <div align="left" style="margin-left: 15px;" class="labels">
             <div align="right">Bill No</div>
          </div></td>
       <td valign="top"><div align="left">
         <s:text name="grn.billNo" class="textbox"></s:text>
       </div></td>
        <td>	<div align="left" style="margin-left: 15px;" class="labels">
          <div align="right">Bill Date</div>
        </div></td>
       <td valign="top"><div align="left">
         <s:text name="grn.billDate" readonly="readonly" onFocus="showCalendarControl(this);" class="textbox"></s:text>
       </div></td>
      </tr>

     <tr>
         <td width="16%" align="left" valign="top">
           <div align="left" style="margin-left: 15px;" class="labels">
             <div align="right">Bill Value</div>
          </div></td>
       <td valign="top"><div align="left">
         <s:text name="grn.billValue" class="textbox"></s:text>
       </div></td>
        <td>	<div align="left" style="margin-left: 15px;" class="labels">
          <div align="right">Truck No</div>
        </div></td>
       <td valign="top"><div align="left">
         <s:text name="grn.truckNo" class="textbox"></s:text>   <s:hidden name="grn.deleted" value="1"/>
       </div></td>
      </tr>

      <tr>
        <td colspan="4"><br><div align="left" style="margin-left:10px;">
				<table width="98%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;" align="left" id="family">
					<tr>
						<td width="10%" height="28px" style="border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;" >Item Code</span></strong></div></td>
					    <td width="20%"  style="border-right:1px solid #000000; background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Item name</span></strong></div></td>
					    <td width="7%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Uom</span></strong></div></td>
					    <td width="10%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">OrderedQty</span></strong></div></td>
					     <td width="10%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">ChallanQty</span></strong></div></td>
					    <td width="10%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">ReceivedQty</span></strong></div></td>
                          <td width="10%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">AcceptedQty</span></strong></div></td>
					    <td width="10%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Value</span></strong></div></td>
					    <td width="8%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Remarks</span></strong></div></td>
					  </tr>
                            <%--  <c:forEach var="i" begin="1" end="6" step="1" varStatus ="status" >--%>
                           <c:forEach items="${actionBean.purchaseOrder.purchasedetailarray}" var="grndetailarray" varStatus="loop" >
					      <tr id="tabletr">
					        <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					          <div align="right">
                                   <s:select id="itemcode"  name="grndetailarray[${loop.index}].item.id" style="width :80px;background-color:#FFF;  "  onchange= "return GetItemDetail(this);">
                        <option  value="0">---Select Item---</option>
                                        <c:forEach items="${actionBean.itemidlst}" var="itemidloop" >
                    <c:choose>
                  <c:when test="${grndetailarray.item.id eq itemidloop}">
			            <option value ="<c:out value="${grndetailarray.item.id}"/>" selected="selected"> <c:out value="${grndetailarray.item.id}"/></option>
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
					           <s:text type="text" name="itemNamefor" readonly="readonly" value="${grndetailarray.item.name}" id="item${loop.index}" class="hello" style="text-align:right;margin-right:2px; width:200px; "  />
					         </div></div></td>
					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					           <s:text  name="uomfor" id="uom${loop.index}" readonly="readonly" value="${grndetailarray.item.uom.name}" style="text-align:right;margin-right:2px;width:70px; "/>
					         </div></div></td>
                               <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					            <s:text  name="purchasedetailarray[${loop.index}].orderedQty" readonly="readonly" value="${grndetailarray.orderedQty}" style="text-align:right;margin-right:2px;width :60px; "/>
					         </div></div></td>
                               <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					            <s:text  name="grndetailarray[${loop.index}].challanQty" style="text-align:right;margin-right:2px;width :60px; "/>
					         </div></div></td>
                               <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					             <s:text  name="grndetailarray[${loop.index}].receivedQty"  style="text-align:right;margin-right:2px;width :60px; "/>
					         </div></div></td>
                               <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
                               <s:text  name="grndetailarray[${loop.index}].acceptedQty"  style="text-align:right;margin-right:2px;width:60px; "/>
					         </div></div></td>
					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
                                <s:text  name="grndetailarray[${loop.index}].value"  style="text-align:right;margin-right:2px;width :60px;"/>
					         </div></div></td>
					         <td style="border-top:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
					              <s:text  name="grndetailarray[${loop.index}].remark"  style="text-align:right;margin-right:2px;width:100px; "/>
					        </div></div></td>
					     </tr>             </c:forEach>

                  
				</table>
                <%--  <tr><td colspan="4">
                        <div style="text-align:right; cursor: pointer;" class="links"><span style="vertical-align: top;text-align: left;font-size:medium; " class="addRow" id="add" >Add row</span></div>
                    </td></tr>--%>
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
	<s:submit name="addGrn" value="Add"></s:submit>

        &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="reset"  value="Reset" name="reset"  style="width:80px" />
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <s:submit name="cancel" value="Cancel"></s:submit>
	  </div></td>
	<td width="3%" align="left">&nbsp;</td>
	</tr> </s:form> </c:if>
    </table></td></tr></table>

      </s:layout-component>
</s:layout-render>
