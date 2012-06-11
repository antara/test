package com.erp.dao.implementation;

import com.erp.dao.BaseDao;
import com.erp.dao.GrnDetailDao;
import com.erp.pojo.GrnDetail;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 21, 2012
 * Time: 11:12:54 AM
 * To change this template use File | Settings | File Templates.
 */
public class GrnDetailDaoImpl extends BaseDao implements GrnDetailDao{
    public boolean SaveGrnDetail(GrnDetail grndetail){
      try {

            tr=getSession().beginTransaction();
            if(grndetail!=null){
               getSession().save(grndetail);
                tr.commit();
                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally{
          //  getSession().close();
        }   

    }
}
