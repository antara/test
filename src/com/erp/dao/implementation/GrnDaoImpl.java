package com.erp.dao.implementation;

import com.erp.dao.BaseDao;
import com.erp.dao.GrnDao;
import com.erp.pojo.Grn;
import com.erp.pojo.GrnDetail;
import com.erp.pojo.Item;
import com.erp.pojo.DailyStockRecord;
import com.erp.utils.BaseUtils;
import java.util.*;
import java.math.BigInteger;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Query;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 21, 2012
 * Time: 11:08:05 AM
 * To change this template use File | Settings | File Templates.
 */
public class GrnDaoImpl extends BaseDao implements GrnDao{
     Date today=new Date();
    //save
      public boolean SaveGrn(Grn grn, List<GrnDetail> grndetail)

    {
     try {
                   GrnDetail g=null;

         for(Iterator<GrnDetail> i=grndetail.iterator();i.hasNext();){
              g=(GrnDetail)i.next();

             if(g==null){
                 i.remove();
                continue;        
             }else if(g.getAcceptedQty()==null){
                 i.remove();
                 continue;
             }
             System.out.println("g: "+g);
                Query strQuery = getSession().createSQLQuery("Select id from daily_stock where item_id='"+g.getItem().getId()+"'");
				List<?> lst = strQuery.list();
				if (lst != null && lst.size() <= 0) {
                   DailyStockRecord dailystock=new DailyStockRecord();
                    dailystock.setOpenQuantity(0);
                    dailystock.setReceivedQuantity(g.getAcceptedQty());
                    dailystock.setIssuedQuantity(0);
                        dailystock.setItem(g.getItem());
                        dailystock.setClosingQuantity(g.getAcceptedQty());
                           if (dailystock.getDate() == null) dailystock.setDate(new Date());
                        session.save(dailystock);
                  
                }  else{
                       Query strQuerydb = getSession().createSQLQuery("Select id,closing_quantity,issued_quantity,open_quantity,received_quantity,create_date from daily_stock where item_id='"+g.getItem().getId()+"'");
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
                       dailystock.setReceivedQuantity(received_quantity+g.getAcceptedQty());
                        dailystock.setIssuedQuantity(issued_quantity);
                        dailystock.setItem(g.getItem());
                        dailystock.setClosingQuantity(open_quantity+received_quantity+g.getAcceptedQty());
                           if (dailystock.getDate() == null) dailystock.setDate(new Date());
                        getSession().update(dailystock);

                        }
                        else{

                              DailyStockRecord dailystock=new DailyStockRecord();
                      dailystock.setOpenQuantity(closing_quantity);
                       dailystock.setReceivedQuantity(g.getAcceptedQty());
                        dailystock.setIssuedQuantity(0);
                        dailystock.setItem(g.getItem());
                        dailystock.setClosingQuantity(closing_quantity+g.getAcceptedQty());
                           if (dailystock.getDate() == null) dailystock.setDate(new Date());
                        getSession().save(dailystock);
                        }
                }

         }

            tr=getSession().beginTransaction();
            if(grn!=null){
                 if (grn.getCreateDate() == null) grn.setCreateDate(new Date());
                grn.setGrndetailarray(grndetail);
               getSession().save(grn);
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

     //get all list
     public List getGrn(){
         String hql="from Grn ";
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
       public List getTodayGrn()  {
          
         String hql="from Grn where createDate like '"+ BaseUtils.getCurrentTimestamp()+"%'";
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
    //find by id
    public Grn findById(Long id){
           try {
              tr=getSession().beginTransaction();
        return (Grn)getSession().createCriteria(Grn.class).add(Restrictions.eq("id",id)).uniqueResult();
           }catch (Exception e){
                e.printStackTrace();
           }
        return null;
    }

      //update
      public void update(Grn grn,List<GrnDetail> grndetail)  {
        try{
                    for(Iterator<GrnDetail> i=grndetail.iterator();i.hasNext();){
                        GrnDetail g=(GrnDetail)i.next();

                        if(g==null){
                            i.remove();
                            continue;

                        }else if(g.getAcceptedQty()==null){
                            i.remove();
                            continue;
                        }
                         Query strQuery = getSession().createSQLQuery("Select id from daily_stock where item_id='"+g.getItem().getId()+"'");
				List<?> lst = strQuery.list();
				if (lst != null && lst.size() <= 0) {
                   DailyStockRecord dailystock=new DailyStockRecord();
                    dailystock.setOpenQuantity(0);
                    dailystock.setReceivedQuantity(g.getAcceptedQty());
                    dailystock.setIssuedQuantity(0);
                        dailystock.setItem(g.getItem());
                        dailystock.setClosingQuantity(g.getAcceptedQty());
                           if (dailystock.getDate() == null) dailystock.setDate(new Date());
                        session.save(dailystock);

                }  else{
                       Query strQuerydb = getSession().createSQLQuery("Select id,closing_quantity,issued_quantity,open_quantity,received_quantity,create_date from daily_stock where item_id='"+g.getItem().getId()+"'");
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
                       Grn strQuerydb1 =(Grn) getSession().createQuery("from Grn where id='"+grn.getId()+"'").uniqueResult();
                    GrnDetail valuefrmdb=null;
          		     for(Iterator<GrnDetail> iterate=strQuerydb1.getGrndetailarray().iterator();iterate.hasNext();){
                              valuefrmdb=(GrnDetail)iterate.next();
                         System.out.println("hhhhhhh"+valuefrmdb);
                     }
                      String idstg=id.toString();
                           long id1ong=Long.parseLong(idstg);
                   DailyStockRecord dailystock = (DailyStockRecord) session.get(DailyStockRecord.class, id1ong);

                      dailystock.setOpenQuantity(open_quantity);
                       dailystock.setReceivedQuantity((received_quantity+g.getAcceptedQty())-valuefrmdb.getAcceptedQty());
                        dailystock.setIssuedQuantity(issued_quantity);
                        dailystock.setItem(g.getItem());
                        dailystock.setClosingQuantity((open_quantity+received_quantity+g.getAcceptedQty())-valuefrmdb.getAcceptedQty());
                           if (dailystock.getDate() == null) dailystock.setDate(new Date());
                                   getSession().update(dailystock);
                    }else{
                             DailyStockRecord dailystock=new DailyStockRecord();
                      dailystock.setOpenQuantity(closing_quantity);
                       dailystock.setReceivedQuantity(g.getAcceptedQty());
                        dailystock.setIssuedQuantity(issued_quantity);
                        dailystock.setItem(g.getItem());
                        dailystock.setClosingQuantity(closing_quantity+g.getAcceptedQty());
                           if (dailystock.getDate() == null) dailystock.setDate(new Date());
                        getSession().save(dailystock);
                    }
                    }
                    }

            System.out.println("inupdate: "+grndetail); 
        tr=getSession().beginTransaction();
             if (grn.getCreateDate() == null) grn.setCreateDate(new Date());
                grn.setGrndetailarray(grndetail);
               getSession().merge(grn);
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
}
