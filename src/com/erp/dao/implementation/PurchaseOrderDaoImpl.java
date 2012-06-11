package com.erp.dao.implementation;

import com.erp.dao.BaseDao;
import com.erp.dao.PurchaseOrderDao;
import com.erp.pojo.PurchaseOrder;
import com.erp.pojo.PurchaseOrderDetail;

import java.util.List;
import java.util.Iterator;
import java.util.Date;

import org.hibernate.criterion.Restrictions;
import org.hibernate.Query;

/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Mar 1, 2012
 * Time: 12:18:18 PM
 * To change this template use File | Settings | File Templates.
 */
public class PurchaseOrderDaoImpl extends BaseDao implements PurchaseOrderDao  {
     public boolean SavePurchaseOrder(PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> purchasedetail){
         try {
                   PurchaseOrderDetail g=null;

         for(Iterator<PurchaseOrderDetail> i=purchasedetail.iterator();i.hasNext();){
              g=(PurchaseOrderDetail)i.next();

             if(g==null){
                 i.remove();
                continue;
             }else if(g.getOrderedQty()==null){
                 i.remove();
                 continue;
             }

              
         }
         System.out.println("new list: "+purchasedetail);
            tr=getSession().beginTransaction();
            if(purchaseOrder!=null){
                 if (purchaseOrder.getCreateDate() == null) purchaseOrder.setCreateDate(new Date());
                Query q=session.createQuery("select max(id) from PurchaseOrder");
                        //int mId=m.getMemberId();
                        List list=q.list();
                String a=null;
                        if(list.contains(null))
                        {
                             a="Po1000";
                          System.out.println("in if");
                        }
                        else
                        {
                        PurchaseOrder ponumber=(PurchaseOrder)session.createQuery("from PurchaseOrder where id=(select  max(id) from PurchaseOrder)").uniqueResult();

                            String orderno=ponumber.getPurchaseOrderNo();
                            int i=Integer.parseInt(orderno.substring(2));
                            i++;

                             a="Po"+i;
                               System.out.println("in else");

                        }
                purchaseOrder.setStatus("true");
		              purchaseOrder.setGeneratedPO(0);  
                    purchaseOrder.setPurchaseOrderNo(a);
                purchaseOrder.setPurchasedetailarray(purchasedetail);

               getSession().save(purchaseOrder);



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

       public List<PurchaseOrder> getPurchaseOrder(){
           String hql="from PurchaseOrder where generatedPO=0";
        // List list=null;
         try {

                 tr=getSession().beginTransaction();


         }catch (Exception e){
             e.printStackTrace();

         }finally{
           //  s.close();
         }
          return (List<PurchaseOrder>)getSession().createQuery(hql).list();
       }

    public void update(PurchaseOrder purchaseOrder,List<PurchaseOrderDetail> purchasedetail){
             try{
                    for(Iterator<PurchaseOrderDetail> i=purchasedetail.iterator();i.hasNext();){
                        PurchaseOrderDetail g=(PurchaseOrderDetail)i.next();

                        if(g==null){
                            i.remove();

                        }else if(g.getOrderedQty()==null){
                            i.remove();
                        }
                    }
           
        tr=getSession().beginTransaction();

                  purchaseOrder.setGeneratedPO(0);  
             if (purchaseOrder.getCreateDate() == null) purchaseOrder.setCreateDate(new Date());
                purchaseOrder.setPurchasedetailarray(purchasedetail);
               getSession().update(purchaseOrder);
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
     public PurchaseOrder findById(Long id){
        PurchaseOrder ud=null;
               try {
                        tr=getSession().beginTransaction();
                       // return (PurchaseOrder)getSession().createQuery("from PurchaseOrder where id='"+id+"'").uniqueResult();
               }catch (Exception e){

               }
             return (PurchaseOrder)getSession().createQuery("from PurchaseOrder where id='"+id+"'").uniqueResult();
     }
    public void deletePO( PurchaseOrder purchaseOrder)  {
        try{
        tr=getSession().beginTransaction();
                          purchaseOrder.setGeneratedPO(0);
                getSession().update(purchaseOrder);

                tr.commit();
           System.out.println("deleted");

        }catch (Exception e){
            e.printStackTrace();

        }finally{
          //  getSession().close();
        }
    }

    public PurchaseOrder latestPurchaseOrder() {
        String hql="from PurchaseOrder where id=(select max(id) from PurchaseOrder)";
        try {

                 tr=getSession().beginTransaction();


         }catch (Exception e){
             e.printStackTrace();

         }finally{
           //  s.close();
         }
          return (PurchaseOrder)getSession().createQuery(hql).uniqueResult();

    }

    public void generatePurchaseOrder(PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> purchasedetail) {
      try{
                    for(Iterator<PurchaseOrderDetail> i=purchasedetail.iterator();i.hasNext();){
                        PurchaseOrderDetail g=(PurchaseOrderDetail)i.next();

                        if(g==null){
                            i.remove();

                        }else if(g.getOrderedQty()==null){
                            i.remove();
                        }
                    }
            System.out.println("inupdate: "+purchasedetail);
        tr=getSession().beginTransaction();

                  purchaseOrder.setGeneratedPO(1);  
             if (purchaseOrder.getCreateDate() == null) purchaseOrder.setCreateDate(new Date());
                purchaseOrder.setPurchasedetailarray(purchasedetail);
               getSession().update(purchaseOrder);
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

    public List<String> getAllPurchaseOrderNo() {
       String hql="Select purchase_order_no from purchase_order where generated_po=0";
            // List list=null;
             try {

                     tr=getSession().beginTransaction();


             }catch (Exception e){
                 e.printStackTrace();

             }finally{
               //  s.close();
             }
              return getSession().createSQLQuery(hql).list();
         }
}
