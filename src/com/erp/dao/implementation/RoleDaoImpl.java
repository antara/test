package com.erp.dao.implementation;

import com.erp.dao.BaseDao;
import com.erp.dao.RoleDao;
import com.erp.pojo.Role;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Feb 24, 2012
 * Time: 3:17:46 PM
 * To change this template use File | Settings | File Templates.
 */
public class RoleDaoImpl extends BaseDao implements RoleDao {
    Transaction tr;
         public List getRole(){

            String hql="from Role where deleted='1'";
            try {

                      tr=getSession().beginTransaction();

            }catch (Exception e){
                e.printStackTrace();

            }finally{
              //  s.close();
            }
             return getSession().createQuery(hql).list();
        }

         public boolean SaveRole(Role role)

       {
        try {

                       tr=getSession().beginTransaction();
               if(role!=null){
                  getSession().save(role);
                   tr.commit();
                   return true;
               }else{
                   return false;
               }
           }catch (Exception e){
               e.printStackTrace();
               return false;
           }finally{
             //  getSession().close();
           }

       }

      

       public Role findById(Long id){
            Role ud=null;
              try {
                                    tr=getSession().beginTransaction();

           return (Role)getSession().createQuery("from Role where id='"+id+"'").uniqueResult();
              }catch (Exception e){

              }
           return null;
       }

    public void delete(Role role) {
       try{
        tr=getSession().beginTransaction();
            System.out.println("in delete "+role);
            role.setDeleted(0);
               getSession().update(role);
                tr.commit();


        }catch (Exception e){
            e.printStackTrace();

        }finally{
          //  getSession().close();
        }
    }

    public void update(Role role) {
        try{
        tr=getSession().beginTransaction();
            System.out.println("in update"+role);
               getSession().update(role);
                tr.commit();


        }catch (Exception e){
            e.printStackTrace();

        }finally{
          //  getSession().close();
        }
    }


}
