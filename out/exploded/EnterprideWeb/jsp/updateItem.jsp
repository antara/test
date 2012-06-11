<%--
  Created by IntelliJ IDEA.
  User: Minal
  Date: Feb 15, 2012
  Time: 10:06:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/_taglibInclude.jsp" %>
<link rel="stylesheet" href="/css/general.css" type="text/css" media="screen" />
    <script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="/js/popup.js" type="text/javascript"></script>
 <script type="text/javascript" src="js/jquery.js"></script>
 <script type="text/javascript">
function ajaxLink(link, update) {

 $ .get(link, function (data) {
 $(update).html(data);
 $(update).show();
 });
 return false;
 }

function submitForm(button,update) {

var form = button.form;
var params = $(form).serializeArray();
params.push({name: '_eventName' , value: button.name});
$.post(form.action, params, function (data) {
$( update ).html(data);
     $(update).show();
     $('#sectiontxt').val("");
      $('#savesectionbtn').show();
          $('#updatesectionbtn').hide();

});
return false;
}

function submitFormuom(button,update) {

var form = button.form;
var params = $(form).serializeArray();
params.push({name: '_eventName' , value: button.name});
$.post(form.action, params, function (data) {
$( update ).html(data);
     $(update).show();
     $('#uomtxt').val("");
      $('#saveuombtn').show();
          $('#updateuombtn').hide();

});
return false;
}

function updateLink(link) {

 $ .get(link, function (data) {

     var result=eval(data);

      $('#sectiontxt').attr("value",result.name);
       $('#sectionhdnid').attr("value",result.id);
     $('#savesectionbtn').hide();
          $('#updatesectionbtn').show();

 });
 return false;
 }
function updateLinkuom(link) {

 $ .get(link, function (data) {

     var result=eval(data);

      $('#uomtxt').attr("value",result.name);
       $('#uomhdnid').attr("value",result.id);
     $('#saveuombtn').hide();
          $('#updateuombtn').show();

 });
 return false;
 }

       $(document).ready(function(){


//LOADING POPUP
//Click the button event!
$("#sectionbutton").click(function(){
//centering with css

centerPopup();
//load popup

loadPopup();
});
           $("#uombutton").click(function(){
//centering with css

centerPopup1();
//load popup

loadPopup1();
});


           $("#popupContactClose1").click(function(){
disablePopup1();

$.get("/Uom.action?paginationUom", function (result) {
    var data=eval(result);
    var options = '<option value="0">---Select UOM---</option>';
                        for (var i = 0; i < data.length; i++) {
                            options += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                        }
                        $("#uomdropdown").html(options);


 });
       $("#uomtxt").val("");
     $("#uomhdnid").val("");
      $('#saveuombtn').show();
          $('#updateuombtn').hide();
});
//Click out event!
/*
$("#backgroundPopup").click(function(){
disablePopup1();
});
*/
           //CLOSING POPUP
//Click the x event!
$("#popupContactClose").click(function(){
disablePopup();
    $.get("/Section.action?paginationSection", function (result) {
        var data=eval(result);
        var options = '<option value="0">---Select Section---</option>';
                            for (var i = 0; i < data.length; i++) {
                                options += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                            }
                            $("#sectiondropdown").html(options);


     });
           $("#sectiontxt").val("");
     $("#sectionhdnid").val("");
     $('#savesectionbtn').show();
          $('#updatesectionbtn').hide();
});
//Click out event!
/*
$("#backgroundPopup").click(function(){
disablePopup();
});
*/
//Press Escape event!
$(document).keypress(function(e){
if(e.keyCode==27 && popupStatus==1){
disablePopup();
}
});
});
   </script>
<s:useActionBean beanclass="com.erp.action.ItemActionBean" var="listofitems" event="pagedirect"></s:useActionBean>
<% request.setAttribute("itemlst",listofitems.getItemlst()); request.setAttribute("sectionlst",listofitems.getSectionlst());
request.setAttribute("uomlst",listofitems.getUomlst());
%>
<s:layout-render name="/layout/_base.jsp">
      <s:layout-component name="body">

   <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr valign="top"><td >&nbsp;
 </td></tr>
 <tr><td align="left" class="pageheading" valign="top">
Item Management > Update Item
 </td></tr>
 <tr valign="top"><td align="center">&nbsp;
 </td></tr>
 </table>
          <s:form beanclass="com.erp.action.ItemActionBean">
  <table width="50%" border="0"><tr><td width="34%" align="left" valign="top">
   <div align="right" style="margin-left: 1px;" class="labels">Please select Item Name<span style="color:#FF0000"> *</span></div></td>
		  <td width="36%" align="left" valign="top" >
		 <s:select name="id" id="itemdropdown" class="dropdown">
                        <option value="">---Select Item---</option>

              <c:forEach items="${itemlst}" var="itemloop" varStatus="loop" >
                <c:choose>
                  <c:when test="${actionBean.item.name eq itemloop.name}">
			            <option value ="<c:out value="${actionBean.item.id}"/>" selected="selected"> <c:out value="${actionBean.item.name}"/></option>
                  </c:when>

                  <c:otherwise>
                 <option value ="<c:out value="${itemloop.id}"/>"> <c:out value="${itemloop.name}"/></option>
                  </c:otherwise>
                  </c:choose>
		      </c:forEach>

                </s:select>

	        </td>
		 <s:errors field="item.id"/>
		  <td width="30%" align="left" valign="top" > <s:submit name="getitem"  value="Get"/></td>
						</tr></table>        </s:form>
          <c:if test="${actionBean.item!=null}">
             <s:form beanclass="com.erp.action.ItemActionBean">
              <table width="70%"  border="1"  cellspacing="0" cellpadding="0"   align="left" bgcolor="#FCFCFC" id="itemupdate_table">
                <tr>
                  <td align="left">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center">

                   <tr ><td width="24%" align="left" valign="top">
                     <div align="right" style="margin-left: 2px;" class="labels"><s:label name="Item Name"></s:label><span style="color:#FF0000"> *</span></div></td>
                  <td width="25%" align="left" valign="top" ><s:text id="updateitemname" name="item.name" class="textbox"></s:text>
                   <s:hidden name="item.deleted"   value="1"/>
                  </td>
                  <td width="22%" align="left" valign="top" ><s:hidden id="updateitemname" name="item.id" class="textbox"></s:hidden><s:errors field="item.name"/> </td>

                  </tr>



               <tr><td align="left" valign="top">
                 <div align="right" style="margin-left: 2px;" class="labels">Item UOM<span style="color:#FF0000"> *</span></div></td>
                        <td align="left" valign="top" >

                       <s:select name="item.uom.id" id="uomdropdown" class="dropdown">
                                      <option value="">---Select UOM---</option>
                                 <c:forEach items="${uomlst}" var="uomloop" varStatus="loop" >
                <c:choose>
                  <c:when test="${actionBean.item.uom.name eq uomloop.name}">
			            <option value ="<c:out value="${actionBean.item.uom.id}"/>" selected="selected"> <c:out value="${actionBean.item.uom.name}"/></option>
                  </c:when>

                  <c:otherwise>
                   <option value ="<c:out value="${uomloop.id}"/>"> <c:out value="${uomloop.name}"/></option>
                  </c:otherwise>
                  </c:choose>
		      </c:forEach>




                              </s:select>

                          </td>
                        <td align="left" valign="top" ><s:button name="add" class="links" id="uombutton" value="Add/Update Uom"></s:button></td>
                        <td width="26%" align="left" valign="top" ><s:errors field="item.uom"/></td>
                                      </tr>


                 <tr><td align="left" valign="top">
                   <div align="right" style="margin-left: 2px;" class="labels">Item Section<span style="color:#FF0000"> *</span></div></td>
                        <td align="left" valign="top" >
                           <s:select name="item.section.id" id="sectiondropdown" class="dropdown">
                                      <option value="">---Select Section---</option>
                              <c:forEach items="${sectionlst}" var="sectionloop" varStatus="loop" >
                <c:choose>
                  <c:when test="${actionBean.item.section.name eq sectionloop.name}">
			            <option value ="<c:out value="${actionBean.item.section.id}"/>" selected="selected"> <c:out value="${actionBean.item.section.name}"/></option>
                  </c:when>

                  <c:otherwise>
                 <option value ="<c:out value="${sectionloop.name}"/>"> <c:out value="${sectionloop.name}"/></option>
                  </c:otherwise>
                  </c:choose>
		      </c:forEach>




                              </s:select>
                          </td>
                        <td align="left" valign="top" ><s:button name="add" class="links" id="sectionbutton" value="Add/Update section"></s:button></td>
                        <td align="left" valign="top" ><s:errors field="item.section"/></td>
                      </tr>


                <tr>
                  <td></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>

                <tr>
                  <td align="left">&nbsp;</td>
                  <td align="left" colspan="3"><div align="left">
                  <s:submit name="updateitem"  value="Update"></s:submit>
                  
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <s:submit name="cancel" value="Cancel"></s:submit>
                    </div></td>
                  <td width="3%" align="left">&nbsp;</td>
                  </tr>
               <tr>
                  <td align="left">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                </tr>
              </table>
              </td>
                    </tr>

              </table>
                       </s:form>

                        <div id="popupContact">
                      <a id="popupContactClose">x</a>

                      <h1>Add Section</h1>
                      <p id="contactArea">
                            <s:form beanclass="com.erp.action.SectionActionBean" id="savesection" >
                         <table width="100%" border="0"><tr><td>
                            <s:label name="Section Name"></s:label><span style="color:#FF0000"> *</span></td>
                  <td width="27%" align="left" valign="top" ><s:text name="section.name"  id="sectiontxt" class="textbox"></s:text>
                   <s:hidden name="section.deleted" value="1"/>
                  </td>

                              <td id="savesectionbtn"><s:hidden name="section.id" id="sectionhdnid"></s:hidden>
                                  <s:submit name="addsection"  value="Save" onclick= "return submitForm(this,'#section_table');"/>

                              </td>
                              <td id="updatesectionbtn" style="display:none;">
                              <s:submit name="update"  value="Update"  onclick= "return submitForm(this,'#section_table');"/>
                              </td>
                         </tr>
                        <tr><td colspan="3" >

                            <div  id="section_table">
                    <%@include file="/jsp/displaytag/section.jsp"%>
                                </div>






                         </td></tr>
                        </table>
                            </s:form>
                      </p>
                  </div>
                  <div id="backgroundPopup"></div>

                              <div id="popupContact1">
                      <a id="popupContactClose1">x</a>

                      <h1>Add Uom</h1>
                      <p id="contactArea1">

                         <s:form beanclass="com.erp.action.UomActionBean" id="saveuom" >
                         <table width="100%" border="0"><tr><td>
                            <s:label name="Uom Name"></s:label><span style="color:#FF0000"> *</span></td>
                  <td width="27%" align="left" valign="top" ><s:text name="uom.name"  id="uomtxt" class="textbox"></s:text>
                   <s:hidden name="uom.deleted" value="1"/>
                  </td>

                              <td id="saveuombtn"><s:hidden name="uom.id" id="uomhdnid"></s:hidden>
                                  <s:submit name="adduom"  value="Save" onclick= "return submitFormuom(this,'#uom_table');"/>

                              </td>
                              <td id="updateuombtn" style="display:none;">
                              <s:submit name="update"  value="Update"  onclick= "return submitFormuom(this,'#uom_table');"/>
                              </td>
                         </tr>
                        <tr><td colspan="3" >

                            <div  id="uom_table">
                    <%@include file="/jsp/displaytag/uom.jsp"%>
                                </div>






                         </td></tr>
                        </table>
                        </td></tr>
                        </table></s:form>
                      </p>
                  </div>
                  <div id="backgroundPopup"></div>
          </c:if>    
 </s:layout-component></s:layout-render>