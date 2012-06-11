package com.erp.dao.implementation;

import com.erp.dao.RequisitionDao;
import com.erp.dao.BaseDao;
import com.erp.pojo.Requisition;
import com.erp.pojo.RequisitionDetail;

import java.util.List;
import java.util.Date;
import java.util.Iterator;

import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 23, 2012
 * Time: 2:08:05 PM
 * To change this template use File | Settings | File Templates.
 */
public class RequisitionDaoImpl extends BaseDao implements RequisitionDao {
    public boolean SaveRequisition(Requisition requisition, List<RequisitionDetail> requisitiondetail) {
     try {

         for(Iterator<RequisitionDetail> i=requisitiondetail.iterator();i.hasNext();){
             RequisitionDetail r=(RequisitionDetail)i.next();

             if(r==null){
                 i.remove();

             }else if(r.getRequiredQty()==null){
                 i.remove();
             }
         }
         System.out.println("new list: "+requisitiondetail);
            tr=getSession().beginTransaction();
            if(requisition!=null){
                 if (requisition.getRequisitionDate() == null) requisition.setRequisitionDate(new Date());

                requisition.setRequisitiondetailarray(requisitiondetail);




               getSession().save(requisition);
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

    public void update(Requisition requisition, List<RequisitionDetail> requisitiondetail) {
        try{
                    for(Iterator<RequisitionDetail> i=requisitiondetail.iterator();i.hasNext();){
                        RequisitionDetail g=(RequisitionDetail)i.next();

                        if(g==null){
                            i.remove();

                        }else if(g.getRequiredQty()==null){
                            i.remove();
                        }
                    }
            System.out.println("inupdate: "+requisitiondetail);
        tr=getSession().beginTransaction();
                requisition.setRequisitiondetailarray(requisitiondetail);
               getSession().update(requisition);
                tr.commit();


        }catch (Exception e){
            e.printStackTrace();

        }finally{
          /*if(session.isOpen()){
              session.flush();
              session.close();
          }*/
        }
    }

    Transaction tr;
    public List getRequisition() {
             String hql="from Requisition";
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


    public boolean SaveRequisition(Requisition requisition) {
          try {

                        tr=getSession().beginTransaction();
                if(requisition!=null){
                     if (requisition.getRequisitionDate() == null) requisition.setRequisitionDate(new Date());
                   getSession().save(requisition);
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

    public void update(Requisition requisition) {
         try{
            tr=getSession().beginTransaction();

                  if(requisition!=null){

                         requisition.setRequisitionDate(new Date());
                   getSession().update(requisition);
                    tr.commit();
                  }

            }catch (Exception e){
                e.printStackTrace();

            }finally{
              //  getSession().close();
            }
        
        
    }

    public Requisition findById(Long id) {

        return (Requisition)getSession().createCriteria(Requisition.class).add(Restrictions.eq("id",id)).uniqueResult();
    }

  
}
