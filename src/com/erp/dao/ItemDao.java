package com.erp.dao;

import com.erp.pojo.Item;
import com.erp.pojo.Section;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 14, 2012
 * Time: 12:28:29 PM
 * To change this template use File | Settings | File Templates.
 */
public interface ItemDao {
     public boolean SaveItem(Item item);
      public List getItem();
     public void delete(Item item);
       public void update(Item item);
    public Item findById(Long id);
      public List getItemId();
}
