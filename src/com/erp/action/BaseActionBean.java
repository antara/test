package com.erp.action;

import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.ActionBeanContext;
import net.sourceforge.stripes.validation.ValidateNestedProperties;
import net.sourceforge.stripes.validation.Validate;
import com.erp.pojo.User;
import com.erp.dao.*;
import com.google.inject.Inject;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 9, 2012
 * Time: 10:43:32 AM
 * To change this template use File | Settings | File Templates.
 */
public class BaseActionBean implements ActionBean{
     private ActionBeanContext context;


    public ActionBeanContext getContext() {
        return context;
    }

    public void setContext(ActionBeanContext context) {
        this.context = context;
    }
      @ValidateNestedProperties({
        @Validate(field="username",on="login", required =true, label = "Username"),
        @Validate(field="password",on="login", required = true, label = "Password")

    })
     public User user;
    @Inject protected UserDao userDao;
    @Inject  protected ItemDao itemdao;
    @Inject  protected SectionDao sectiondao;
    @Inject  protected UomDao uomdao;
     @Inject  protected VendorDao vendordao;
      @Inject  protected GrnDao grndao;
     @Inject  protected GrnDetailDao grndetaildao;
    @Inject protected RequisitionDao requisitiondao;
    @Inject protected RoleDao roledao;
       @Inject protected StoreIssueDao storeissuedao;
    @Inject protected ModuleDao moduledao;
    @Inject protected PurchaseOrderDao purchaseorderdao;
        protected long id;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public User getUser() {
        if(id != 0) {

        return userDao.findById(id);
                 }

        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

   

   
}
