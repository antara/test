package com.erp.dao;


import com.erp.pojo.Vendor;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 17, 2012
 * Time: 3:38:59 PM
 * To change this template use File | Settings | File Templates.
 */
public interface VendorDao {
     public boolean SaveVendor(Vendor vendor);
      public List getVendor();
     public void delete(Vendor vendor);
       public void update(Vendor vendor);
    public Vendor findById(Long id);
     public List<String> allVendor();
    public List<Vendor> findByName(String fname);
}
