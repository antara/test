package com.erp.action;



import java.util.List;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.ajax.JavaScriptResolution;
import com.erp.pojo.Role;

/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Feb 27, 2012
 * Time: 11:04:10 AM
 * To change this template use File | Settings | File Templates.
 */
public class RoleActionBean extends BaseActionBean{
     List<Role> rolelst;

    protected Role role;

    public List<Role> getRolelst() {
        return rolelst;
    }

    public void setRolelst(List<Role> rolelst) {
        this.rolelst = rolelst;
    }

    public Role getRole() {
        if(id != 0) {

               return roledao.findById(id);
          }
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @DefaultHandler
    public Resolution paginationRole(){

         rolelst=roledao.getRole();

       return new JavaScriptResolution(rolelst);
   }

    //To get section unique list by id
      public Resolution readname(){

      role= roledao.findById(id);

       return new JavaScriptResolution(role);
   }
   //Add section
     public Resolution addroledb(){
                           System.out.println("in role"+getRole().getName());
              roledao.SaveRole(getRole());
            rolelst=roledao.getRole();
       return new ForwardResolution("jsp/displaytag/role.jsp");
   }
    //Delete section
     public Resolution delete1(){
        System.out.println("in role b4 delete  "+getRole());
        roledao.delete(getRole());
        System.out.println("in role after delete");
                 rolelst=roledao.getRole();
        return new ForwardResolution("jsp/displaytag/role.jsp");
    }

    //Update section
      public Resolution update(){
        roledao.update(getRole());
                 rolelst=roledao.getRole();
        return new ForwardResolution("jsp/displaytag/role.jsp");
    }
}
