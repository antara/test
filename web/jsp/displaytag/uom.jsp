<%--
  Created by IntelliJ IDEA.
  User: Minal
  Date: Feb 15, 2012
  Time: 3:06:46 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="d" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes-dynattr.tld" %>
<s:useActionBean beanclass="com.erp.action.ItemActionBean" var="listofitems" event="pagedirect"></s:useActionBean>
<% 
request.setAttribute("uomlst",listofitems.getUomlst());
%>
<d:table name="uomlst" pagesize="6" class="disp" id="uom1" requestURI="/Uom.action?paginationUom">
<d:column property="name" title="Uom Name" />
                  <d:column  title="update">
                        <s:link beanclass="com.erp.action.UomActionBean" event="readname" onclick= "return updateLinkuom(this);">
                           <s:param name="id" value="${uom1.id}"></s:param>
                      <img src="/images/edit-icon.png" />
                       </s:link>

                  </d:column>
                   <d:column title="Delete" class="delete">
                       <s:link beanclass="com.erp.action.UomActionBean" event="delete" onclick= "return ajaxLink(this, '#uom_table');">
                           <s:param name="id" value="${uom1.id}"></s:param>
                       <img src="/images/Close-2-icon.png" />
                       </s:link>
                   </d:column>
	 </d:table>