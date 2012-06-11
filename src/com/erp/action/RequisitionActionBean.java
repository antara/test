package com.erp.action;

import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.ajax.JavaScriptResolution;

import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

import com.erp.pojo.Requisition;
import com.erp.pojo.GrnDetail;
import com.erp.pojo.RequisitionDetail;
import com.erp.pojo.Item;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 23, 2012
 * Time: 11:57:26 AM
 * To change this template use File | Settings | File Templates.
 */
public class RequisitionActionBean extends BaseActionBean{
     List<Requisition> requisitionlst=null;
    private Requisition requisition;
      private Item item;
      private List<Item> itemidlst;
    private RequisitionDetail requisitiondetail;
     private List<RequisitionDetail> requisitiondetailarray = new ArrayList<RequisitionDetail>();


    public RequisitionDetail getRequisitiondetail() {
        return requisitiondetail;
    }

    public void setRequisitiondetail(RequisitionDetail requisitiondetail) {
        this.requisitiondetail = requisitiondetail;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public List<RequisitionDetail> getRequisitiondetailarray() {
        return requisitiondetailarray;
    }

    public void setRequisitiondetailarray(List<RequisitionDetail> requisitiondetailarray) {
        this.requisitiondetailarray = requisitiondetailarray;
    }

    public List<Item> getItemidlst() {
        return itemidlst;
    }

    public void setItemidlst(List<Item> itemidlst) {
        this.itemidlst = itemidlst;
    }

    public List<Requisition> getRequisitionlst() {
        return requisitionlst;
    }

    public void setRequisitionlst(List<Requisition> requisitionlst) {
        this.requisitionlst = requisitionlst;
    }

    public Requisition getRequisition() {
         if(id != 0) {

               return requisitiondao.findById(id);
          }
      
        return requisition;
    }

    public void setRequisition(Requisition requisition) {
        this.requisition = requisition;
    }

    public Resolution addRequisitionLink()
    {
         itemidlst= itemdao.getItemId();
        return new ForwardResolution("jsp/addRequisition.jsp");
    }
    public Resolution addrequisition()
    {

       requisitiondao.SaveRequisition(getRequisition(),requisitiondetailarray);
        return new RedirectResolution("jsp/addRequisition.jsp");
        
    }
    public Resolution updateRequisitionLink()
    {
        requisitionlst=storeissuedao.requisitionIds();
         return new ForwardResolution("jsp/updateRequisitionPage.jsp");

    }
    public Resolution updateRequisition()
    {
           requisition=requisitiondao.findById(getId());
          itemidlst= itemdao.getItemId();
          requisitionlst=storeissuedao.requisitionIds();

        return new ForwardResolution("jsp/updateRequisitionPage.jsp");
    }
    public Resolution update()
    {
        requisitiondao.update(getRequisition(),requisitiondetailarray);
           requisitionlst=requisitiondao.getRequisition();
        return new RedirectResolution("jsp/updateRequisitionPage.jsp");
     
    }
    public Resolution getItemDetails()
    {
         System.out.println("list:"+ id);
       item= itemdao.findById(id);
        return new JavaScriptResolution(item);
       
    }
     
}
