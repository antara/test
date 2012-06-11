package com.erp.action;

import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.ajax.JavaScriptResolution;
import net.sourceforge.stripes.validation.ValidateNestedProperties;
import net.sourceforge.stripes.validation.Validate;

import java.util.List;

import com.erp.dao.ItemDao;
import com.erp.dao.SectionDao;
import com.erp.dao.UomDao;
import com.erp.pojo.Item;
import com.erp.pojo.Uom;
import com.erp.pojo.Section;
import com.google.inject.Inject;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 13, 2012
 * Time: 9:59:26 AM
 * To change this template use File | Settings | File Templates.
 */
public class ItemActionBean extends BaseActionBean{
     List<Uom> uomlst;

    List<Section> sectionlst;
    List<Item> itemlst;


     /*@ValidateNestedProperties({
        @Validate(field="name",on="additem", required =true, label = "Itemname"),
        @Validate(field="uom",on="additem", required = true, label = "Uom name"),
        @Validate(field="section",on="additem", required = true, label = "Section name")
    })*/
      private Item item;

    public List<Item> getItemlst() {
        return itemlst;
    }

    public void setItemlst(List<Item> itemlst) {
        this.itemlst = itemlst;
    }


    public Item getItem() {
         if(id != 0) {

               return itemdao.findById(id);
          }
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public List<Uom> getUomlst() {
        return uomlst;
    }

    public void setUomlst(List<Uom> uomlst) {
        this.uomlst = uomlst;
    }

    public List<Section> getSectionlst() {
        return sectionlst;
    }

    public void setSectionlst(List<Section> sectionlst) {
        this.sectionlst = sectionlst;
    }

    @DefaultHandler
   public Resolution pagedirect(){
           uomlst=uomdao.getUom();
         sectionlst=sectiondao.getSection();
                 itemlst=itemdao.getItem();
      
       return new ForwardResolution("jsp/addItem.jsp");
   }
  //Delete a item
     public Resolution delete(){
        itemdao.delete(getItem());
                 itemlst=itemdao.getItem();
        return new ForwardResolution("jsp/deleteItem.jsp");
    }
  //Add a item
     public Resolution additem(){
        
         itemdao.SaveItem(getItem());
              
       return new RedirectResolution(getContext().getSourcePage());
   }
  //Redirect to delete item page
     public Resolution deleteitemlink(){
            itemlst=itemdao.getItem();

      return new ForwardResolution("jsp/deleteItem.jsp");
   }
  //Redirect to update item page
     public Resolution updateitemlink(){
            itemlst=itemdao.getItem();

      return new ForwardResolution("jsp/updateItem.jsp");
   }
   //get list of item
   public Resolution getitem(){
                      System.out.println("id"+id);
             item= itemdao.findById(id);
         uomlst=uomdao.getUom();
         sectionlst=sectiondao.getSection();
                 itemlst=itemdao.getItem();
        return new ForwardResolution("jsp/updateItem.jsp");
    }

    //Update a item
     public Resolution updateitem(){

       itemdao.update(getItem());
                itemlst=itemdao.getItem();
        return new RedirectResolution("jsp/updateItem.jsp");
    }
  
}
