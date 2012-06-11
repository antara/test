package com.erp.guice;

import com.google.inject.AbstractModule;
import com.erp.dao.*;
import com.erp.dao.implementation.*;

/**
 * Created by IntelliJ IDEA.
 * User: Ashay
 * Date: Jan 23, 2012
 * Time: 10:50:59 AM
 * To change this template use File | Settings | File Templates.
 */
public class RegistrationModule extends AbstractModule{

    @Override
    protected void configure() {
        System.out.println("RegistrationModule configure");
        bind(ItemDao.class).to(ItemDaoImpl.class);
           bind(SectionDao.class).to(SectionDaoImpl.class);
           bind(UomDao.class).to(UomDaoImpl.class);
           bind(UserDao.class).to(UserDaoImpl.class);
             bind(VendorDao.class).to(VendorDaoImpl.class);
           bind(GrnDao.class).to(GrnDaoImpl.class);
         bind(GrnDetailDao.class).to(GrnDetailDaoImpl.class);
         bind(RequisitionDao.class).to(RequisitionDaoImpl.class);
        bind(RequisitionDetailDao.class).to(RequisitionDetailDaoImpl.class);
         bind(RoleDao.class).to(RoleDaoImpl.class);
          bind(StoreIssueDao.class).to(StoreIssueDaoImpl.class);
         bind(ModuleDao.class).to(ModuleDaoImpl.class);
          bind(PurchaseOrderDao.class).to(PurchaseOrderDaoImpl.class);
    }
}
