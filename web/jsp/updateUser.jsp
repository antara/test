<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: Feb 21, 2012
  Time: 10:56:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/_taglibInclude.jsp" %>
<link rel="stylesheet" href="/css/general.css" type="text/css" media="screen" />
    <script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="/js/popup.js" type="text/javascript"></script>
 <script type="text/javascript" src="/js/jquery.js"></script>
 <script type="text/javascript">
$(document).ready(function() {
/*$('#err').hide();*/
$("#updateusername1").click(function(){
    alert("hi");
/*data=$('#password1').val();*/
//var len=data.length;
//if(len<1)
//{
//$('#password1').next.show();
//}
//else
//{
//$('#password1').next().hide();
//}
if($('#password1').val() !=$('#confpass').val())
{
alert("passwords do not match.");
    return false;
}
/*else
{
$('#confpass').next().hide();
}
event.preventDefault();*/
});
});
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
     $('#roletxt').val("");
      $('#saverolebtn').show();
          $('#updaterolebtn').hide();

});
return false;
}

function updateLink(link) {

 $ .get(link, function (data) {

     var result=eval(data);

      $('#roletxt').attr("value",result.name);
       $('#rolehdnid').attr("value",result.id);
     $('#saverolebtn').hide();
          $('#updaterolebtn').show();

 });
 return false;
 }
   

       $(document).ready(function(){


//LOADING POPUP
//Click the button event!
$("#rolebutton").click(function(){
//centering with css

centerPopup();
//load popup

loadPopup();
});



           //CLOSING POPUP
//Click the x event!
$("#popupContactClose").click(function(){
disablePopup();
    $.get("/Role.action?paginationRole", function (result) {
        var data=eval(result);
        var options = '<option value="0">---Select Role---</option>';
                            for (var i = 0; i < data.length; i++) {
                                options += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                            }
                            $("#roledropdown").html(options);


     });
           $("#roletxt").val("");
     $("#rolehdnid").val("");
     $('#saverolebtn').show();
          $('#updaterolebtn').hide();
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
<s:useActionBean beanclass="com.erp.action.UserActionBean" var="listofuser" event="updateUserLink"></s:useActionBean>
<% request.setAttribute("userlst",listofuser.getUserlst());
%>
<s:layout-render name="/layout/_base.jsp">
      <s:layout-component name="body">

   <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr valign="top"><td >&nbsp;
 </td></tr>
 <tr><td align="left" class="pageheading" valign="top">
User Management > Update User
 </td></tr>
 <tr valign="top"><td align="center">&nbsp;
 </td></tr>
 </table>
          <s:form beanclass="com.erp.action.UserActionBean">
  <table width="50%" border="0"><tr><td width="34%" align="left" valign="top">
   <div align="right" style="margin-left: 1px;" class="labels">Please Select User Name<span style="color:#FF0000"> *</span></div></td>
		  <td width="27%" align="left" valign="top" >
		 <s:select name="id" id="userdropdown" class="dropdown">

                        <option value="">---Select User---</option>
            <c:forEach items="${userlst}" var="userloop" varStatus="loop" >
                   <c:choose>
                  <c:when test="${actionBean.user.user_id eq userloop.user_id}">
			            <option value ="<c:out value="${actionBean.user.user_id}"/>" selected="selected"> <c:out value="${actionBean.user.username}"/></option>
                  </c:when>

                  <c:otherwise>
              <option value ="<c:out value="${userloop.user_id}"/>"> <c:out value="${userloop.username}"/></option>
                </c:otherwise>
                  </c:choose>

		      </c:forEach>

                </s:select>
	        </td>
		      <s:errors field="user.id"/>
		  <td width="36%" align="left" valign="top" > <s:submit name="userlist" value="Get"/></td>
						</tr></table>        </s:form>
      <c:if test="${actionBean.user!=null}">
       <s:form beanclass="com.erp.action.UserActionBean">
                           <table width="70%"  border="1"  cellspacing="0" cellpadding="0"   align="left" bgcolor="#FCFCFC" id="itemupdate_table">
                <tr>
                  <td align="left">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center">


    <tr>
      <td width="24%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Name<span style="color:#FF0000"> *</span></div>     </td>
      <td width="26%" align="left" valign="top"><div align="left"><s:text name="user.username" class="textbox"/>
      <s:hidden name="user.deleted" value="1"/>
      </div> </td>
        <td width="22%" align="left" valign="top" ><s:hidden id="updateusername" name="user.user_id" class="textbox"></s:hidden><s:errors field="item.name"/> </td>
       



      <tr>
        <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Password<span style="color:#FF0000"> *</span></div></td>
        <td align="left" valign="top"><div align="left"><s:password name="user.password" class="textbox" id="password1"/></div></td>


      <tr>
        <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Confirm Password<span style="color:#FF0000"> *</span></div></td>
        <td align="left" valign="top"><div align="left"><s:password name="user.password" class="textbox" id="confpass"/><%--<span id="err"> Password and confirm password doesnot match</span>--%></div></td>

      </tr>
                 <tr>
        <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Role<span style="color:#FF0000"> *</span></div></td>
        <td align="left" valign="top" >

			 <s:select name="user.role.id" id="roledropdown" class="dropdown">
                        <option value="">---Select Role---</option>
                   <c:forEach items="${actionBean.rolelst}" var="role" varStatus="loop" >
                   <c:choose>
                  <c:when test="${actionBean.user.role.id eq role.id}">
			            <option value ="<c:out value="${actionBean.user.role.id}"/>" selected="selected"> <c:out value="${actionBean.user.role.name}"/></option>
                  </c:when>

                  <c:otherwise>
             	<option value ="<c:out value="${role.id}"/>"> <c:out value="${role.name}"/></option>
                </c:otherwise>
                  </c:choose>

		      </c:forEach>
            </s:select>
        </div></td>
        <td align="left" valign="top" ><s:button name="add" class="links" id="rolebutton" value="Add/Update Role"></s:button></td>
		  <td width="28%" align="left" valign="top" ><s:errors field="user.role"/></td>

      </tr>
      <tr>
          <td>&nbsp;</td>
    <td  colspan="2" align="left" ><div ><s:submit name="updateUser" value="Update" id="updateusername1"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;
    <s:reset name="reset" value="Reset"></s:reset>   &nbsp;&nbsp;&nbsp;&nbsp;
        <s:submit name="cancel" value="Cancel"></s:submit></div></td></tr>
     </table>
              </td>
                    </tr>

              </table> </tr>
       </table>     </s:form>
      </c:if>
                          

           <c:if test="${actionBean.user!=null}">
          <div id="popupContact">
                 <a id="popupContactClose">x</a>

                 <h1>Add Role</h1>
                 <p id="contactArea">
                       <s:form beanclass="com.erp.action.RoleActionBean" id="saverole">
                    <table width="100%" border="0"><tr><td>
                       <s:label name="Role Name"></s:label><span style="color:#FF0000"> *</span></td>
             <td width="27%" align="left" valign="top" ><s:text name="role.name"  id="roletxt" class="textbox"></s:text>
             <s:hidden name="role.deleted" value="1"/>
             </td>

                         <td id="saverolebtn"><s:hidden name="role.id" id="rolehdnid"></s:hidden>
                             <s:submit name="addroledb"  value="Save" onclick= "return submitForm(this,'#role_table');"/>

                         </td>
                         <td id="updaterolebtn" style="display:none;">
                         <s:submit name="update"  value="Update"  onclick= "return submitForm(this,'#role_table');"/>
                         </td>
                    </tr>
                   <tr><td colspan="3" >

                       <div  id="role_table">
               <%@include file="/jsp/displaytag/role.jsp"%>
                           </div>






                    </td></tr>
                   </table>
                       </s:form>
                 </p>
             </div>
             <div id="backgroundPopup"></div>
            </c:if>

          
 </s:layout-component></s:layout-render>