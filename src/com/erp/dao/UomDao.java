package com.erp.dao;


import com.erp.pojo.Uom;
import com.erp.pojo.Section;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 14, 2012
 * Time: 12:45:33 PM
 * To change this template use File | Settings | File Templates.
 */
public interface UomDao {
     public List getUom();
     public boolean SaveUom(Uom uom);
    public void delete(Uom uom);
      public void update(Uom uom);
    public Uom findById(Long id);
}
