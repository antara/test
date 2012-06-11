package com.erp.action;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.ajax.JavaScriptResolution;
import com.erp.pojo.*;

import java.util.ArrayList;
import java.util.List;


/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 20, 2012
 * Time: 4:42:02 PM
 * To change this template use File | Settings | File Templates.
 */
public class GrnActionBean extends BaseActionBean{
     private Grn grn;
     private List<Vendor> vendorlst;
     private List<Item> itemidlst;
    private List<Grn> grnlst;
    private Item item;
      private List<PurchaseOrder> purchaseorderlst;
    private List<GrnDetail> grndetailarray = new ArrayList<GrnDetail>();
    private GrnDetail grndetail;
     private PurchaseOrder purchaseOrder;
              protected long  iddrop;

    public PurchaseOrder getPurchaseOrder() {
      
        return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
        this.purchaseOrder = purchaseOrder;
    }
    public Grn getGrn() {
          if(id != 0) {

              
               return grndao.findById(id);
          }
        return grn;
    }

    public void setGrn(Grn grn) {
        this.grn = grn;
    }

   public GrnDetail getGrndetail() {

        return grndetail;
    }

    public void setGrndetail(GrnDetail grndetail) {
        this.grndetail = grndetail;
    }

    public List<GrnDetail> getGrndetailarray() {
        return grndetailarray;
    }

    public void setGrndetailarray(List<GrnDetail> grndetailarray) {
        this.grndetailarray = grndetailarray;
    }

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

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public List<Grn> getGrnlst() {
        return grnlst;
    }

    public void setGrnlst(List<Grn> grnlst) {
        this.grnlst = grnlst;
    }

    public List<PurchaseOrder> getPurchaseorderlst() {

        return purchaseorderlst;
    }

    public void setPurchaseorderlst(List<PurchaseOrder> purchaseorderlst) {
        this.purchaseorderlst = purchaseorderlst;
    }

    public long getIddrop() {
        return iddrop;
    }

    public void setIddrop(long iddrop) {
        this.iddrop = iddrop;
    }

    @DefaultHandler
   public Resolution addGrnLink(){
         purchaseorderlst=purchaseorderdao.getPurchaseOrder();
         vendorlst=vendordao.getVendor();
        itemidlst= itemdao.getItemId();
       return new ForwardResolution("jsp/addGrn.jsp");
   }

     public Resolution addGrn(){
         System.out.println("list"+grndetailarray);
         grndao.SaveGrn(getGrn(),grndetailarray);
        //  grndetaildao.SaveGrnDetail(getGrndetail());
       return new RedirectResolution("jsp/addGrn.jsp");
   }

    public Resolution getItemDetails(){
       System.out.println("list:"+ id);     
       item= itemdao.findById(id);
        return new JavaScriptResolution(item);
    }

    public Resolution updateGrnLink(){
           grnlst=grndao.getTodayGrn();
        
          return new ForwardResolution("jsp/updateGrn.jsp");
      }

     public Resolution getGrnButton()
    {


        grn=grndao.findById(id);
             purchaseorderlst=purchaseorderdao.getPurchaseOrder();
             grnlst=grndao.getTodayGrn();
             vendorlst=vendordao.getVendor();
        itemidlst= itemdao.getItemId();
        return new ForwardResolution("jsp/updateGrn.jsp");

    }
    //Update a grn
     public Resolution updategrn(){

       grndao.update(getGrn(),grndetailarray);
           grnlst=grndao.getTodayGrn();     
        return new RedirectResolution("jsp/updateGrn.jsp");
    }
    public Resolution getorderlstforgrn(){
         purchaseOrder =purchaseorderdao.findById(iddrop);
        System.out.println("ffffffffffffff"+grn);
         purchaseorderlst=purchaseorderdao.getPurchaseOrder();
         vendorlst=vendordao.getVendor();
        itemidlst= itemdao.getItemId();
      
        return new ForwardResolution("jsp/addGrn.jsp");
    }
}

