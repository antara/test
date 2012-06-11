package com.erp.dao;

import com.erp.pojo.Requisition;
import com.erp.pojo.StoreIssue;
import com.erp.pojo.StoreIssueDetail;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 28, 2012
 * Time: 12:32:24 PM
 * To change this template use File | Settings | File Templates.
 */
public interface StoreIssueDao {
       public List getRequisition();
       public boolean SaveStoreIssue(StoreIssue storeissue, List<StoreIssueDetail> storeissuedetail);
       public StoreIssue findById(long id);
       public List requisitionIds();
       public List issuedids();
       public void update(StoreIssue storeissue,List<StoreIssueDetail> storeissuedetailarray);



   
}
