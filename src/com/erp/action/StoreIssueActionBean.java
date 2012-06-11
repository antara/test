package com.erp.action;

import com.erp.pojo.Requisition;
import com.erp.pojo.Item;
import com.erp.pojo.StoreIssueDetail;
import com.erp.pojo.StoreIssue;

import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.ajax.JavaScriptResolution;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 28, 2012
 * Time: 12:25:13 PM
 * To change this template use File | Settings | File Templates.
 */
public class StoreIssueActionBean extends BaseActionBean{
    List<StoreIssue> storeissuelst;
    private StoreIssue storeissue;
     List<Requisition> requisitionlst;
    private Requisition requisition;
      private Item item;
      private List<Item> itemidlst;
   private List<StoreIssueDetail> storeissuedetailarray=new ArrayList<StoreIssueDetail>();
    private List requisitionIds;
    private List issuedids;

    public List getIssuedids() {
        return issuedids;
    }

    public void setIssuedids(List issuedids) {
        this.issuedids = issuedids;
    }

    public List<Long> getRequisitionIds() {
        return requisitionIds;
    }

    public void setRequisitionIds(List<Long> requisitionIds) {
        this.requisitionIds = requisitionIds;
    }

    public List<StoreIssueDetail> getStoreissuedetailarray() {
        return storeissuedetailarray;
    }

    public void setStoreissuedetailarray(List<StoreIssueDetail> storeissuedetailarray) {
        this.storeissuedetailarray = storeissuedetailarray;
    }

    public List<StoreIssue> getStoreissuelst() {
        return storeissuelst;
    }

    public void setStoreissuelst(List<StoreIssue> storeissuelst) {
        this.storeissuelst = storeissuelst;
    }

    public StoreIssue getStoreissue() {
        if(id!=0)
        {
            return storeissuedao.findById(getId());
        }
        return storeissue;
    }
     public void setStoreissue(StoreIssue storeissue) {
        this.storeissue = storeissue;
    }
    public List<Requisition> getRequisitionlst() {
        return requisitionlst;
    }

    public void setRequisitionlst(List<Requisition> requisitionlst) {
        this.requisitionlst = requisitionlst;
    }

    public Requisition getRequisition() {
        return requisition;
    }

    public void setRequisition(Requisition requisition) {
        this.requisition = requisition;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public List<Item> getItemidlst() {
        return itemidlst;
    }

    public void setItemidlst(List<Item> itemidlst) {
        this.itemidlst = itemidlst;
    }

    public Resolution addStoreIssueLink()
    {
        requisitionlst=storeissuedao.getRequisition();
        requisitionIds=storeissuedao.requisitionIds();
        issuedids=storeissuedao.issuedids();
        itemidlst= itemdao.getItemId();
        return new ForwardResolution("jsp/addStoreIssue.jsp");
    }
    public Resolution addStoreIssue()
    {
        requisition=requisitiondao.findById(id);
        requisitionIds=storeissuedao.requisitionIds();
        itemidlst= itemdao.getItemId();
        return new ForwardResolution("jsp/addStoreIssue.jsp");
    }
    public Resolution getItemDetails()
    {
        item= itemdao.findById(id);
        return new JavaScriptResolution(item);
    }
    public Resolution addissue()
    {
        storeissuedao.SaveStoreIssue(getStoreissue(),storeissuedetailarray);
        return new RedirectResolution("jsp/addStoreIssue.jsp");
    }
    public Resolution updateStoreIssueLink()
    {
        issuedids=storeissuedao.issuedids();
        return new ForwardResolution("jsp/updateStoreIssue.jsp");
    }
    public Resolution updateStoreIssue()
    {
        itemidlst= itemdao.getItemId();
        issuedids=storeissuedao.issuedids();
        requisition=requisitiondao.findById(getId());
        storeissue=storeissuedao.findById(getId());
        return new ForwardResolution("jsp/updateStoreIssue.jsp");
    }
    public Resolution update()
    {
        storeissuedao.update(getStoreissue(),storeissuedetailarray);
        issuedids=storeissuedao.issuedids();
        return new RedirectResolution("jsp/updateStoreIssue.jsp");
    }
}
