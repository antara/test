package com.erp.dao.implementation;

import com.erp.dao.BaseDao;
import com.erp.dao.StoreIssueDao;
import com.erp.pojo.*;
import com.erp.utils.BaseUtils;
import java.util.List;
import java.util.Iterator;
import java.util.Date;
import java.math.BigInteger;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Query;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 28, 2012
 * Time: 12:34:35 PM
 * To change this template use File | Settings | File Templates.
 */
public class StoreIssueDaoImpl extends BaseDao implements StoreIssueDao{
    public void update(StoreIssue storeissue,List<StoreIssueDetail> storeissuedetailarray) {
        try{
               for(Iterator<StoreIssueDetail> i=storeissuedetailarray.iterator();i.hasNext();){
                        StoreIssueDetail s=(StoreIssueDetail)i.next();
                        if(s==null){
                            i.remove();
                        }
                        else if(s.getIssueQty()==0){
                            i.remove();
                        }


             }
                storeissue.setStoreissuedetailarray(storeissuedetailarray);
                tr=getSession().beginTransaction();
                getSession().update(storeissue);
                tr.commit();
            }
        catch (Exception e){
            e.printStackTrace();
        }
        finally{

        }
   }
    public List getRequisition(){
             String hql="from Requisition";
             try {
                     tr=getSession().beginTransaction();
             }catch (Exception e){
                 e.printStackTrace();

             }finally{

             }
              return getSession().createQuery(hql).list();
            }
   public boolean SaveStoreIssue(StoreIssue storeissue, List<StoreIssueDetail> storeissuedetail) {
     try {
           for(Iterator<StoreIssueDetail> i=storeissuedetail.iterator();i.hasNext();){
             StoreIssueDetail r=(StoreIssueDetail)i.next();
               if(r==null){
                 i.remove();
               }else if(r.getIssueQty()==0){
                 i.remove();
             }

               Query strQuerydb = getSession().createSQLQuery("Select id,closing_quantity,issued_quantity,open_quantity,received_quantity,create_date from daily_stock where item_id='"+r.getItem().getId()+"'");
                  List<?> lst1 = strQuerydb.list();
            Iterator idb=lst1.iterator();
            BigInteger id=null;
             double closing_quantity=0,issued_quantity=0,open_quantity=0,received_quantity=0;
           // Date datedb=null;
              String sst = null,datedb=null;
            while (idb.hasNext()){
                Object[] rowData=(Object[])idb.next();
                   id=(BigInteger)rowData[0];
                     closing_quantity=(Double)rowData[1];
                 issued_quantity=(Double)rowData[2];
                 open_quantity=(Double)rowData[3];
                 received_quantity=(Double)rowData[4];
                        datedb = (rowData[5].toString()).substring(0,10);
            }

                 if(BaseUtils.getCurrentTimestamp().equals(datedb)){

                     String idstg=id.toString();
                   long id1ong=Long.parseLong(idstg);
                  DailyStockRecord dailystock = (DailyStockRecord) session.get(DailyStockRecord.class, id1ong);

              dailystock.setOpenQuantity(open_quantity);
               dailystock.setReceivedQuantity(received_quantity);
                dailystock.setIssuedQuantity(issued_quantity+r.getIssueQty());
                dailystock.setItem(r.getItem());
                dailystock.setClosingQuantity(closing_quantity-r.getIssueQty());
                   if (dailystock.getDate() == null) dailystock.setDate(new Date());
                getSession().update(dailystock);

                }
                else{

                      DailyStockRecord dailystock=new DailyStockRecord();
              dailystock.setOpenQuantity(closing_quantity);
               dailystock.setReceivedQuantity(0);
                dailystock.setIssuedQuantity(r.getIssueQty());
                dailystock.setItem(r.getItem());
                dailystock.setClosingQuantity(closing_quantity-r.getIssueQty());
                   if (dailystock.getDate() == null) dailystock.setDate(new Date());
                getSession().save(dailystock);
                }
               
         }
            tr=getSession().beginTransaction();
            if(storeissue!=null){
                 if (storeissue.getIssueDate() == null) storeissue.setIssueDate(new Date());
                        storeissue.setStoreissuedetailarray(storeissuedetail);
                getSession().save(storeissue);
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

    public StoreIssue findById(long id) {
          StoreIssue ud=null;
               try {
                        tr=getSession().beginTransaction();
                        return (StoreIssue)getSession().createQuery("from StoreIssue where requisition_id='"+id+"'").uniqueResult();
               }catch (Exception e){

               }
            return null;
    }

    public List requisitionIds() {
        List l=null;
        String hql="SELECT r.id FROM requisition r LEFT OUTER JOIN storeissue s on r.id=s.requisition_id WHERE s.requisition_id IS NULL";
        try {
                    tr=getSession().beginTransaction();
                    l=getSession().createSQLQuery(hql).list();
                    return l;
        }catch (Exception e){
                    e.printStackTrace();
        }
        finally{
        }
        return null;
   }

    public List issuedids() {
        List l=null;
        String hql="SELECT DISTINCT s.requisition_id FROM requisition r LEFT OUTER JOIN storeissue s on (r.id=s.requisition_id) WHERE s.requisition_id IS NOT NULL and issue_date like '"+ BaseUtils.getCurrentTimestamp()+"%'";
       try {
                 tr=getSession().beginTransaction();
                 l=getSession().createSQLQuery(hql).list();
                 return l;
       }catch (Exception e){
                e.printStackTrace();
       }finally{
       }
       return null;
    }
}
