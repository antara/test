package com.erp.dao;

import com.erp.pojo.Requisition;
import com.erp.pojo.RequisitionDetail;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 23, 2012
 * Time: 1:06:41 PM
 * To change this template use File | Settings | File Templates.
 */
public interface RequisitionDao {
    public boolean SaveRequisition(Requisition requisition);
    public void update(Requisition requisition);
    public Requisition findById(Long id);
  
    public List getRequisition();
       public boolean SaveRequisition(Requisition requisition, List<RequisitionDetail> requisitiondetail);
     public void update(Requisition requisition,List<RequisitionDetail> requisitiondetail);
    

}
