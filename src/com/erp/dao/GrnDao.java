package com.erp.dao;


import com.erp.pojo.Grn;
import com.erp.pojo.GrnDetail;
import com.erp.pojo.Item;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 21, 2012
 * Time: 11:08:15 AM
 * To change this template use File | Settings | File Templates.
 */
public interface GrnDao {
     public boolean SaveGrn(Grn grn, List<GrnDetail> grndetail);
       public List getGrn();
    public List getTodayGrn();
       public void update(Grn grn,List<GrnDetail> grndetail);
     public Grn findById(Long id);
}
