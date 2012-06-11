package com.erp.action;

import com.erp.pojo.Vendor;
import com.erp.pojo.Item;
import com.erp.pojo.PurchaseOrder;
import com.erp.pojo.PurchaseOrderDetail;

import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;
import java.io.SyncFailedException;
import java.io.StringReader;

import net.sourceforge.stripes.action.*;
import net.sourceforge.stripes.ajax.JavaScriptResolution;

/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Feb 29, 2012
 * Time: 5:34:00 PM
 * To change this template use File | Settings | File Templates.
 */
public class PurchaseOrderActionBean extends BaseActionBean{
    private List<Vendor> vendorlst;
     private List<Item> itemidlst;
     private List<PurchaseOrder> purchaseorderlst;
    private Item item;
    private PurchaseOrderDetail purchasedetail;
    private List<PurchaseOrderDetail> purchasedetailarray = new ArrayList<PurchaseOrderDetail>();
       private PurchaseOrder purchaseOrder;
    private List<String> allPurchaseOrderNo;

    public List<String> getAllPurchaseOrderNo() {
        return allPurchaseOrderNo;
    }

    public void setAllPurchaseOrderNo(List<String> allPurchaseOrderNo) {
        this.allPurchaseOrderNo = allPurchaseOrderNo;
    }

    public PurchaseOrder getPurchaseOrder() {
        if(id != 0) {
               return purchaseorderdao.findById(id);
          }
        return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
        this.purchaseOrder = purchaseOrder;
    }

    public PurchaseOrderDetail getPurchasedetail() {
        return purchasedetail;
    }

    public void setPurchasedetail(PurchaseOrderDetail purchasedetail) {
        this.purchasedetail = purchasedetail;
    }


    public List<PurchaseOrder> getPurchaseorderlst() {
        return purchaseorderlst;
    }

    public void setPurchaseorderlst(List<PurchaseOrder> purchaseorderlst) {
        this.purchaseorderlst = purchaseorderlst;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public List<PurchaseOrderDetail> getPurchasedetailarray() {
        return purchasedetailarray;
    }

    public void setPurchasedetailarray(List<PurchaseOrderDetail> purchasedetailarray) {
        this.purchasedetailarray = purchasedetailarray;
    }

    public PurchaseOrderDetail getGrndetail() {
        return grndetail;
    }

    public void setGrndetail(PurchaseOrderDetail grndetail) {
        this.grndetail = grndetail;
    }

    private PurchaseOrderDetail grndetail;

    public List<Vendor> getVendorlst() {
        return vendorlst;
    }

    public void setVendorlst(List<Vendor> vendorlst) {
        this.vendorlst = vendorlst;
    }

    public List<Item> getItemidlst() {
        return itemidlst;
    }

    public void setItemidlst(List<Item> itemidlst) {
        this.itemidlst = itemidlst;
    }
    
    @DefaultHandler
     public Resolution addPOLink(){
      vendorlst=vendordao.getVendor();
        itemidlst= itemdao.getItemId();

        return new ForwardResolution("jsp/addPurchaseOrder.jsp");
   }
    public Resolution getItemDetails(){
                            System.out.println("list:"+ id);
           item= itemdao.findById(id);
            return new JavaScriptResolution(item);
        }
    public Resolution addPurchaseOrder(){
            purchaseorderdao.SavePurchaseOrder(getPurchaseOrder(),purchasedetailarray);
            purchaseOrder=purchaseorderdao.latestPurchaseOrder();
            return new RedirectResolution("jsp/previewPurchaseOrder.jsp");
       }
      public Resolution getPOButton()
    {
         System.out.println("ID :"+id);

       purchaseOrder =purchaseorderdao.findById(id);
          System.out.println("ID :"+purchaseOrder);
             purchaseorderlst=purchaseorderdao.getPurchaseOrder();
             vendorlst=vendordao.getVendor();
        itemidlst= itemdao.getItemId();
        return new ForwardResolution("jsp/updatePurchaseOrder.jsp");

    }

    public Resolution updatePurchaseOrder(){
      //  System.out.println("hgjgh");
         //System.out.println("list:"+ purchasedetailarray);

       purchaseorderdao.update(getPurchaseOrder(),purchasedetailarray);
            purchaseorderlst=purchaseorderdao.getPurchaseOrder();
            return new RedirectResolution("jsp/previewPurchaseOrder.jsp");
    }

    public Resolution updatePOLink(){
            vendorlst=vendordao.getVendor();
            itemidlst= itemdao.getItemId();
            purchaseorderlst=purchaseorderdao.getPurchaseOrder();
            purchaseOrder=purchaseorderdao.latestPurchaseOrder();
            return new ForwardResolution("jsp/updatePurchaseOrder.jsp");
      }
    public Resolution deletePOLink(){
            purchaseorderlst=purchaseorderdao.getPurchaseOrder();
            return new ForwardResolution("jsp/deletePurchaseOrder.jsp");
   }
    public Resolution generatePurchaseOrder()
    {
            System.out.print("in GPO");
        String result="aaa";
            vendorlst=vendordao.getVendor();
            itemidlst= itemdao.getItemId();
            purchaseorderlst=purchaseorderdao.getPurchaseOrder();
            purchaseOrder=purchaseorderdao.latestPurchaseOrder();
            purchaseorderdao.generatePurchaseOrder(getPurchaseOrder(),purchasedetailarray);
            purchaseorderlst=purchaseorderdao.getPurchaseOrder();
       
        return new ForwardResolution("jsp/RedirectPurchaseOrder.jsp");
            
    }

    public Resolution delete(){
       System.out.println("in delete");
        purchaseorderdao.deletePO(getPurchaseOrder());
                  purchaseorderlst=purchaseorderdao.getPurchaseOrder();;
        return new ForwardResolution("jsp/deletePurchaseOrder.jsp");
    }
   public Resolution cancel()
   {
       return new RedirectResolution("jsp/addPurchaseOrder.jsp");
   }
     public Resolution generatePurchaseOrderLink()
    {
            purchaseorderlst= purchaseorderdao.getPurchaseOrder();
            System.out.println(purchaseorderlst);
            return new ForwardResolution("jsp/generatePurchaseOrder.jsp");
    }
    public Resolution getToGenaratePurchaseOrder()
    {
        System.out.println("...............in gettogeneratepurchaseorder...............");

        System.out.println("ID :"+getId());

        purchaseorderlst= purchaseorderdao.getPurchaseOrder();

            System.out.print(purchaseorderlst);

        purchaseOrder=purchaseorderdao.findById(getId());
        System.out.print("purch :"+purchaseOrder);
        return new ForwardResolution("jsp/generatePurchaseOrder.jsp");
    }
    public Resolution generateUpdatePOLink()
    {
          //  System.out.print("PO NO"+getPurchaseOrder().getGeneratedPO());
             vendorlst=vendordao.getVendor();
        System.out.println(getVendorlst());
            itemidlst= itemdao.getItemId();
            System.out.print("ID :"+getId());
            purchaseorderlst=purchaseorderdao.getPurchaseOrder();
             purchaseOrder=purchaseorderdao.findById(getId());
        System.out.print("Purchase Order :"+purchaseOrder);
        return new ForwardResolution("jsp/updateGeneratePurchaseOrder.jsp");
    }
    public Resolution updateGeneratePurchaseOrder()
    {
        System.out.print(getPurchasedetailarray());
        purchaseorderdao.update(getPurchaseOrder(),purchasedetailarray);
            purchaseorderlst=purchaseorderdao.getPurchaseOrder();
       // System.out.println("inupdate: "+getPurchaseorderlst());
        Iterator it=purchaseorderlst.iterator();
        while (it.hasNext())
        {
            System.out.println(it.next());
        }
        return new RedirectResolution("jsp/previewGeneratePurchaseOrder.jsp");
    }
}
