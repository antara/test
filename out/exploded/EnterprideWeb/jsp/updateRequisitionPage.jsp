
<%@ include file="/includes/_taglibInclude.jsp" %>
<link rel="stylesheet" href="/css/general.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/stylesheet.css"/>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

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
<s:useActionBean beanclass="com.erp.action.RequisitionActionBean" var="listofrequisition" event="updateRequisitionLink"></s:useActionBean>
<%
    request.setAttribute("requisitionlst",listofrequisition.getRequisitionlst());
    request.setAttribute("itemlst",listofrequisition.getItemidlst());

%>
<s:layout-render name="/layout/_base.jsp">
      <s:layout-component name="body">

    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr valign="top"><td >&nbsp;
 </td></tr>
 <tr><td align="left" class="pageheading" valign="top">
Material Requisition > Update
 </td></tr>
 <tr valign="top"><td align="center">&nbsp;
 </td></tr>
 </table>
 <s:form beanclass="com.erp.action.RequisitionActionBean">

 <table width="50%" border="0"><tr><td width="35%" align="left" valign="top">
   <div align="right" style="margin-left: 1px;" class="labels">Please select Requisition <span style="color:#FF0000"> *</span></div></td>
		  <td width="39%" align="left" valign="top" >
             
<s:select id="vendorName" name="id" class="dropdown">
                        <option  value="0">---Select Id---</option>
              <c:forEach items="${requisitionlst}" var="requisition" varStatus="loop" >
                    <c:choose>
                  <c:when test="${actionBean.requisition.id eq requisition}">
			            <option value ="<c:out value="${requisition}"/>" selected="selected"> <c:out value="${requisition}"/></option>
                  </c:when>

                <c:otherwise>
               <option value ="${requisition}"><c:out value="${requisition}"/></option>
                  </c:otherwise>
                  </c:choose>
				<%--<option value ="<c:out value="${vendor.vendorName}"/>"><c:out value="${vendor.vendorName}"/></option>--%>

		      </c:forEach>

                </s:select>

	        </td>

		  <td width="26%" align="left" valign="top" > <s:submit name="updateRequisition"  value="Get"/></td>
						</tr></table>
           </s:form>
              <c:if test="${actionBean.requisition!=null}">
                  <s:form beanclass="com.erp.action.RequisitionActionBean">

  <table border="1" width="70%" bgcolor="#FCFCFC" ><tr><td>
<table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC">

  <tr>
   <td width="28%" align="right" valign="top"> <div align="right" style="margin-left: 2px;" class="labels">Name Of Contractor<span style="color:#FF0000"> *</span></div>     </td>
    <td width="18%" align="left" valign="top"><div align="left"><s:text name="requisition.nameOfContractor" class="textbox"></s:text></div> </td>
    <td width="20%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Name Of User</div></td>
    <td width="18%" align="right" valign="top"><s:text name="requisition.nameOfUser" class="textbox"></s:text><s:hidden id="requisitionid" name="requisition.id" class="textbox"></s:hidden></td>





  <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Job<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:text name="requisition.job" class="textbox"></s:text></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Drawing No<span style="color:#FF0000"> *</span></div></td>
    <td width="18%" align="right" valign="top"><s:text name="requisition.drawingNo" class="textbox"></s:text></td>

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
        <td colspan="4"><br><div align="right" style="margin-left:2px;">
				<table width="90%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;" align="right" id="family">
					<tr>
						<td width="20%" height="28px" style="border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;" >Item Code</span></strong></div></td>
					    <td width="25%"  style="border-right:1px solid #000000; background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Item name</span></strong></div></td>
					   <td width="20%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Uom</span></strong></div></td>
                       <td width="25%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Required Qty</span></strong></div></td>

					  </tr>
                              <c:forEach items="${actionBean.requisition.requisitiondetailarray}" var="requisitiondetailarray" varStatus="loop" >


					      <tr id="tabletr">
					        <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					          <div align="right">
                                   <s:select id="itemcode" name="requisitiondetailarray[${loop.index}].item.id"  onchange= "return GetItemDetail(this);">
                        <option  value="0">---Select Item---</option>
                                        <c:forEach items="${actionBean.itemidlst}" var="itemidloop" >
                    <c:choose>
                  <c:when test="${requisitiondetailarray.item.id eq itemidloop}">
			            <option value ="<c:out value="${requisitiondetailarray.item.id}"/>" selected="selected"> <c:out value="${requisitiondetailarray.item.id}"/></option>
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
					           <s:text name="requisitiondetail.itemName" readonly="readonly" value="${requisitiondetailarray.item.name}" id="item${loop.index}" class="hello" style="text-align:right;margin-right:2px; width:200px; "  />
					         </div></div></td>
					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					           <s:text  name="requisitiondetail.uom" readonly="readonly" id="uom${loop.index}" value="${requisitiondetailarray.item.uom.name}" style="text-align:right;margin-right:2px;width:100px; "/>
					         </div></div></td>
                               <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					            <s:text  name="requisitiondetailarray[${loop.index}].requiredQty" value="${requisitiondetailarray.requiredQty}" style="text-align:right;margin-right:2px;width:100px; "/>
					         </div></div></td>

					     </tr>             </c:forEach>


				</table>

                 
				</div></td>
      </tr>
 <tr>

                  <td colspan="4" align="left" valign="top" >
                        <div style="text-align:right; cursor: pointer;" class="links"><span style="vertical-align: top;text-align: left;font-size:medium; " class="addRow" id="add" >Add row</span></div>
                    </td>

                    </tr>
      <tr>
        <td align="left">&nbsp;</td>
        <td align="left" colspan="3">&nbsp;</td>
        <td align="left">&nbsp;</td>
      </tr>
      <tr>
	<td align="left">&nbsp;</td>
	<td align="left" colspan="3"><s:submit name="update" value="Update"></s:submit>
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
          </c:if>
      </s:layout-component>
</s:layout-render>
