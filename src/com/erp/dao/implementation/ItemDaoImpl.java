package com.erp.dao.implementation;

import com.erp.dao.BaseDao;
import com.erp.dao.ItemDao;
import com.erp.utils.HibernateUtils;
import com.erp.pojo.Item;

import org.hibernate.Transaction;
import org.hibernate.FetchMode;
import org.hibernate.criterion.Restrictions;

import java.util.List;
import java.util.Iterator;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 14, 2012
 * Time: 12:27:30 PM
 * To change this template use File | Settings | File Templates.
 */
public class ItemDaoImpl extends BaseDao implements ItemDao {


    //save
      public boolean SaveItem(Item item)

    {
     try {
         System.out.println(item.toString());
                    tr=getSession().beginTransaction();
            if(item!=null){
               getSession().save(item);
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
       public void delete(Item item)  {
        try{
        tr=getSession().beginTransaction();
                          item.setDeleted(0);
                getSession().update(item);
                tr.commit();


        }catch (Exception e){
            e.printStackTrace();

        }finally{
          //  getSession().close();
        }
    }
  //find by id
    public Item findById(Long id){
         Item ud=null;
           try {
                                 tr=getSession().beginTransaction();
                                  System.out.println("id"+id);
        return (Item)getSession().createQuery("from Item where id='"+id+"'").uniqueResult();
           }catch (Exception e){

           }
        return null;
    }

      public List getItemId(){
          String hql="select id from Item where deleted='1'";
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
    //get all list
     public List getItem(){

         String hql="from Item where deleted='1'";
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
      public void update(Item item)  {
        try{
        tr=getSession().beginTransaction();

               getSession().update(item);
                tr.commit();


        }catch (Exception e){
            e.printStackTrace();

        }finally{
          //  getSession().close();
        }
    }
    
}
