
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/_taglibInclude.jsp" %>
<link rel="stylesheet" href="/css/general.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/stylesheet.css"/>
<script type="text/javascript">

           function GetItemDetail(button) {
                   var rowid=button.name.substring(button.name.indexOf("[")+1,button.name.indexOf("]"));
        $.post('Requisition.action?getItemDetails', {id:button.value}, function (data) {
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

            $('#family #tabletr:last select:eq(0)').attr("name","requisitiondetailarray["+count+"].item.id");
            $('#family #tabletr:last input:eq(0)').attr("id","item"+count);
            $('#family #tabletr:last input:eq(1)').attr("id","uom"+count);
            $('#family #tabletr:last input:eq(2)').attr("name","requisitiondetailarray["+count+"].requiredQty");


        });

           });



       </script>
  <s:useActionBean beanclass="com.erp.action.RequisitionActionBean" var="listofitem" event="addRequisitionLink"></s:useActionBean>
<%
    request.setAttribute("itemidlst",listofitem.getItemidlst());
%>
<s:layout-render name="/layout/_base.jsp">
      <s:layout-component name="body">
       <s:form beanclass="com.erp.action.RequisitionActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr valign="top"><td >&nbsp;
 </td></tr>
 <tr><td align="left" class="pageheading" valign="top">
Material Requisition > Add
 </td></tr>
 <tr valign="top"><td align="center">&nbsp;
 </td></tr>
 </table>
 <table border="1" width="70%" bgcolor="#FCFCFC" ><tr><td>
<table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC">
  
  <tr>
   <td width="19%" align="right" valign="top"> <div align="right" style="margin-left: 2px;" class="labels">Name Of Contractor<span style="color:#FF0000"> *</span></div>     </td>
    <td width="19%" align="left" valign="top"><div align="left"><s:text name="requisition.nameOfContractor" class="textbox"></s:text></div> </td>
    <td width="25%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Name Of User</div></td>
    <td width="21%" align="right" valign="top"><s:text name="requisition.nameOfUser" class="textbox"></s:text></td>

   


  
  <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Job<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:text name="requisition.job" class="textbox"></s:text></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Drawing No<span style="color:#FF0000"> *</span></div></td>
    <td width="21%" align="right" valign="top"><s:text name="requisition.drawingNo" class="textbox"></s:text></td>
   
  </tr>
  <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Part No<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left">
      <s:text name="requisition.partNo" class="textbox"></s:text>
    </div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Person Authorising<span style="color:#FF0000"> *</span></div></td>
<td  align="right" valign="top"><s:text name="requisition.personAuthorising" class="textbox"></s:text></td>
  </tr>
  <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Material Return<span style="color:#FF0000"> *</span></div></td>
    <td colspan="2" align="left" valign="top"><div align="left">
      <s:radio  value="true" id="radio1"  name="requisition.useMaterialReturn"></s:radio>
      Yes&nbsp;
      <s:radio  value="false" id="radio2"  name="requisition.useMaterialReturn"></s:radio>
      No </div></td>
  
   
  </tr>
  
<!--....................................................................................................................... -->
<tr>
        <td colspan="4"><br><div align="left" style="margin-left:10px;">
				<table width="90%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;" align="left" id="family">
					<tr>
						<td width="20%" height="28px" style="border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;" >Item Code</span></strong></div></td>
					    <td width="25%"  style="border-right:1px solid #000000; background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Item name</span></strong></div></td>
					   <td width="20%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Uom</span></strong></div></td>
                          <td width="25%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Required Qty</span></strong></div></td>
					    
					  </tr>
                              <c:forEach var="i" begin="1" end="4" step="1" varStatus ="status" >


					      <tr id="tabletr">
					        <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					          <div align="right">
                                   <s:select id="itemcode" name="requisitiondetailarray[${i}].item.id"  onchange= "return GetItemDetail(this);">
                        <option  value="0">---Select Item---</option>
              <c:forEach items="${itemidlst}" var="itemidloop" varStatus="loop" >



               <option value ="${itemidloop}"><c:out value="${itemidloop}"/></option>


		      </c:forEach>

                </s:select>
					         <%--   <s:text name="grndetailarray[${i}].item.id"  style="text-align:right;margin-right:2px;width:100px; "  />--%>
					          </div></div></td>
					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">
					         <div align="right">
					           <s:text name="requisitiondetail.itemName" readonly="readonly" id="item${i}" class="hello" style="text-align:right;margin-right:2px; width:200px; "  />
					         </div></div></td>
					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					           <s:text  name="requisitiondetail.uom" readonly="readonly" id="uom${i}" style="text-align:right;margin-right:2px;width:200px; "/>
					         </div></div></td>
                               
                               <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
                               <s:text  name="requisitiondetailarray[${i}].requiredQty"  style="text-align:right;margin-right:2px;width:180px; "/>
					         </div></div></td>
					     
					     </tr>             </c:forEach>

                  
				</table>
                
                  <tr>
                  
                  <td colspan="4" align="left" valign="top" >
                        <div style="text-align:right; cursor: pointer;" class="links"><span style="vertical-align: top;text-align: left;font-size:medium; " class="addRow" id="add" >Add row</span></div>
                    </td>
                   
                    </tr>
				</div></td>
      </tr>

      <tr>
        <td align="left">&nbsp;</td>
        <td align="left" colspan="3">&nbsp;</td>
        <td align="left">&nbsp;</td>
      </tr>
      <tr>
	<td align="left">&nbsp;</td>
	<td align="left" colspan="3"><s:submit name="addrequisition" value="Add"></s:submit>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <s:reset name="reset" value="Reset"></s:reset>
&nbsp;&nbsp;&nbsp;&nbsp;
<s:submit name="cancel" value="Cancel"></s:submit></td>
	<td width="16%" align="left">&nbsp;</td>
	</tr>
    </table></td></tr>
<!--............................................................................................................................. -->
 
   
</table>
 </table>
    </s:form>
      </s:layout-component>
</s:layout-render>
