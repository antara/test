package com.erp.dao.implementation;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

import com.erp.utils.HibernateUtils;
import com.erp.dao.BaseDao;
import com.erp.dao.SectionDao;
import com.erp.pojo.Uom;
import com.erp.pojo.Section;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 14, 2012
 * Time: 12:42:04 PM
 * To change this template use File | Settings | File Templates.
 */
public class SectionDaoImpl extends BaseDao implements SectionDao{
 
    
      public List getSection(){

         String hql="from Section where deleted='1'";
         try {

                   tr=getSession().beginTransaction();

         }catch (Exception e){
             e.printStackTrace();

         }finally{
           //  s.close();
         }
          return getSession().createQuery(hql).list();
     }

      public boolean SaveSection(Section section)

    {
     try {

                    tr=getSession().beginTransaction();
            if(section!=null){
               getSession().save(section);
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

    public void delete(Section section){
        try{
        tr=getSession().beginTransaction();
            System.out.println("in delete "+section);
            section.setDeleted(0);
               getSession().update(section);
                tr.commit();


        }catch (Exception e){
            e.printStackTrace();
          
        }finally{
          //  getSession().close();
        }
    }

    public Section findById(Long id){
         Section ud=null;
           try {
                                 tr=getSession().beginTransaction();

        return (Section)getSession().createQuery("from Section where id='"+id+"'").uniqueResult();
           }catch (Exception e){

           }
        return null;
    }

      public void update(Section section){
        try{
        tr=getSession().beginTransaction();
            System.out.println("in delete "+section);
               getSession().update(section);
                tr.commit();


        }catch (Exception e){
            e.printStackTrace();

        }finally{
          //  getSession().close();
        }
    }
 }
