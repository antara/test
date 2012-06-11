package com.erp.dao.implementation;

import org.hibernate.Transaction;

import com.erp.pojo.Vendor;
import com.erp.dao.BaseDao;
import com.erp.dao.VendorDao;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 17, 2012
 * Time: 3:38:36 PM
 * To change this template use File | Settings | File Templates.
 */
public class VendorDaoImpl extends BaseDao implements VendorDao{
    

        //save
          public boolean SaveVendor(Vendor vendor)

        {
         try {

                        tr=getSession().beginTransaction();
                if(vendor!=null){
                   getSession().save(vendor);
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
        //delete
           public void delete(Vendor vendor)  {
            try{
            tr=getSession().beginTransaction();
                              vendor.setDeleted(0);
                    getSession().update(vendor);
                    tr.commit();


            }catch (Exception e){
                e.printStackTrace();

            }finally{
              //  getSession().close();
            }
        }
      //find by id
        public Vendor findById(Long id){
             Vendor ud=null;
               try {
                                     tr=getSession().beginTransaction();
                                      System.out.println("id"+id);
            return (Vendor)getSession().createQuery("from Vendor where id='"+id+"'").uniqueResult();
               }catch (Exception e){

               }
            return null;
        }

        //get all list
         public List getVendor(){

             String hql="from Vendor where deleted='1'";
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
          //update
          public void update(Vendor vendor)  {
            try{
            tr=getSession().beginTransaction();

                   getSession().update(vendor);
                    tr.commit();


            }catch (Exception e){
                e.printStackTrace();

            }finally{
              //  getSession().close();
            }
        }
    public List<Vendor> findByName(String fname) {
                   List<Vendor> l=null;
                   try {
                                         System.out.print("in try :"+fname);
                                         tr=getSession().beginTransaction();

               return (List<Vendor>)getSession().createQuery("from Vendor where name='"+fname+"'").list();

                   }catch (Exception e){

                   }
                return null;

        }

         public List<String> allVendor() {
               String hql="Select name from Vendor";
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


