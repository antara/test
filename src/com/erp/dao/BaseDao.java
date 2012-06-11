package com.erp.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.erp.utils.HibernateUtils;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 14, 2012
 * Time: 12:25:55 PM
 * To change this template use File | Settings | File Templates.
 */
public class BaseDao {
      protected Session session;
   protected Transaction tr;
      
    public BaseDao() {
        session= HibernateUtils.getSession();
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }
}
