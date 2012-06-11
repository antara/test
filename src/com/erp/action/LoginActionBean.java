package com.erp.action;

import net.sourceforge.stripes.action.*;

import com.erp.exception.LoginException;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 9, 2012
 * Time: 10:42:59 AM
 * To change this template use File | Settings | File Templates.
 */
public class LoginActionBean extends BaseActionBean{
   @DefaultHandler       
    public Resolution login()
    {       

        try{
              
          userDao.authenticate(getUser());

                }catch(LoginException le){
                           getContext().getMessages().add(new SimpleMessage("Invalid User"));
            
                   return new RedirectResolution("jsp/login.jsp");
                }

                return new ForwardResolution("jsp/main_page.jsp");

       
    }
}
