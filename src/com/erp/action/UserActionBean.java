package com.erp.action;

import net.sourceforge.stripes.action.*;

import java.util.List;
import java.util.Iterator;

import com.erp.pojo.User;
import com.erp.pojo.Role;
import com.erp.pojo.Module;
import org.hibernate.Transaction;

/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Feb 20, 2012
 * Time: 3:33:43 PM
 * To change this template use File | Settings | File Templates.
 */
public class UserActionBean extends BaseActionBean{
     private List<User> userlst;
       private Role role;

       List<Role> rolelst;
    List<Module> modulelst;
    public List<User> getUserlst() {
        return userlst;
    }
    public void setUserlst(List<User> userlst) {
           this.userlst = userlst;

       }

    public Role getRole() {
        if(id!=0)
              return roledao.findById(id);
         return null;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<Role> getRolelst() {
        return rolelst;
    }

    public void setRolelst(List<Role> rolelst) {
        this.rolelst = rolelst;
    }

    public List<Module> getModulelst() {
        return modulelst;
    }

    public void setModulelst(List<Module> modulelst) {
        this.modulelst = modulelst;
    }

    @DefaultHandler
    public Resolution addUserLink(){
        userlst=userDao.getUser();
                 rolelst=roledao.getRole();

        return new ForwardResolution("jsp/addUser.jsp");
   }
     public Resolution addUser(){

         System.out.println("b4 saving "+getUser());
         userDao.SaveUser(getUser());
          rolelst=roledao.getRole();
         System.out.println("after saving "+getUser());
       return new ForwardResolution("jsp/addUser.jsp");
   }
 public Resolution updateUserLink(){
     userlst=userDao.getUser();
        return new ForwardResolution("jsp/updateUser.jsp");
   }
  public Resolution updateUser()
  {    
        userDao.update(getUser());
            userlst=userDao.getUser();
        return new RedirectResolution("jsp/updateUser.jsp");

  }
     public Resolution userlist(){
                      
         user= userDao.findById(id);
          rolelst=roledao.getRole();
         userlst=userDao.getUser();

        return new ForwardResolution("jsp/updateUser.jsp");
    }
     public Resolution deleteUserLink(){
            userlst=userDao.getUser();

      return new ForwardResolution("jsp/deleteUser.jsp");
   }
    public Resolution delete(){

        userDao.delete(getUser());
                 userlst=userDao.getUser();
        return new ForwardResolution("jsp/deleteUser.jsp");
    }
     public Resolution UserPermissionLink(){
         rolelst=roledao.getRole();
          modulelst=moduledao.getModule();
          return new ForwardResolution("jsp/userPermission.jsp"); 
     }
}
