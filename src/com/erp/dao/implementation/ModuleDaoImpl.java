package com.erp.dao.implementation;

import com.erp.dao.BaseDao;
import com.erp.dao.ModuleDao;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Mar 2, 2012
 * Time: 11:54:42 AM
 * To change this template use File | Settings | File Templates.
 */
public class ModuleDaoImpl extends BaseDao implements ModuleDao{

    //get all list
     public List getModule(){
         String hql="from Module where deleted='1'";
        // List list=null;
         try {
                 tr=getSession().beginTransaction();
         }catch (Exception e){
             e.printStackTrace();

         }finally{
           //  s.close();
         }
          return getSession().createQuery(hql).list();
     }
}
