package com.erp.dao.implementation;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

import com.erp.utils.HibernateUtils;
import com.erp.dao.BaseDao;
import com.erp.dao.UomDao;

import com.erp.pojo.Uom;
import com.erp.pojo.Section;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 14, 2012
 * Time: 12:44:24 PM
 * To change this template use File | Settings | File Templates.
 */
public class UomDaoImpl extends BaseDao implements UomDao{
  
      
       public List getUom(){

          String hql="from Uom where deleted='1'";
          try {

                       tr=getSession().beginTransaction();

          }catch (Exception e){
              e.printStackTrace();

          }finally{
            //  s.close();
          }
           return getSession().createQuery(hql).list();
      }

     public boolean SaveUom(Uom uom)

    {
     try {

                    tr=getSession().beginTransaction();
            if(uom!=null){
               getSession().save(uom);
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
  public void delete(Uom uom){
        try{
        tr=getSession().beginTransaction();
                 uom.setDeleted(0);
               getSession().update(uom);
                tr.commit();


        }catch (Exception e){
            e.printStackTrace();

        }finally{
          //  getSession().close();
        }
    }

    public Uom findById(Long id){
         Uom ud=null;
           try {
                                 tr=getSession().beginTransaction();

        return (Uom)getSession().createQuery("from Uom where id='"+id+"'").uniqueResult();
           }catch (Exception e){

           }
        return null;
    }
    public void update(Uom uom){
           try{
           tr=getSession().beginTransaction();

                  getSession().update(uom);
                   tr.commit();


           }catch (Exception e){
               e.printStackTrace();

           }finally{
             //  getSession().close();
           }
       }
    }
 

