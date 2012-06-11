package com.erp.dao;

import com.erp.pojo.PurchaseOrder;
import com.erp.pojo.PurchaseOrderDetail;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Mar 1, 2012
 * Time: 12:16:28 PM
 * To change this template use File | Settings | File Templates.
 */
public interface PurchaseOrderDao {
    public boolean SavePurchaseOrder(PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> purchasedetail);
       public List<PurchaseOrder> getPurchaseOrder();
       public void update(PurchaseOrder purchaseOrder,List<PurchaseOrderDetail> purchasedetail);
     public PurchaseOrder findById(Long id);
     public void deletePO( PurchaseOrder purchaseOrder);
    public PurchaseOrder latestPurchaseOrder();
    public void generatePurchaseOrder(PurchaseOrder purchaseOrder,List<PurchaseOrderDetail> purchasedetail);
    public List<String> getAllPurchaseOrderNo();
}


