package com.erp.dao.implementation;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.erp.pojo.User;
import com.erp.exception.LoginException;
import com.erp.utils.HibernateUtils;
import com.erp.dao.BaseDao;
import com.erp.dao.UserDao;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 14, 2012
 * Time: 12:46:02 PM
 * To change this template use File | Settings | File Templates.
 */
public class UserDaoImpl extends BaseDao implements UserDao{

   


    public void authenticate(User u) throws LoginException {

                   tr=getSession().beginTransaction();

            if(getSession().createQuery("from User where username=:user and password=:pass").setString("user",u.getUsername()).setString("pass",u.getPassword()).uniqueResult()==null){
                throw new LoginException("invalid credentials");
            }
    }
  public boolean SaveUser(User u)
    {
         try {
        
                    tr=getSession().beginTransaction();
            if(u!=null){
               getSession().save(u);
                tr.commit();
                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally{
           getSession().close();
        }
    }
    public User findById(Long id){
         User ud=null;
           try {
                                 tr=getSession().beginTransaction();
                                  
        return (User)getSession().createQuery("from User where id='"+id+"'").uniqueResult();
           }catch (Exception e){

           }
        return null;
    }
    public List getUser(){
           Transaction   tr;
            String hql="from User where deleted='1'";
           // List list=null;
            try {

                    tr=getSession().beginTransaction();


            }catch (Exception e){
                e.printStackTrace();

            }finally{
              //  s.close();
            }
             return getSession().createQuery(hql).list();
        }
       public void update(User user)  {

        try{
       
            tr=getSession().beginTransaction();

               getSession().update(user);
                tr.commit();


        }catch (Exception e){
            e.printStackTrace();

        }finally{
          //  getSession().close();
        }
    }
    public void delete(User user)  {
        try{
        tr=getSession().beginTransaction();
                          user.setDeleted(0);
                getSession().update(user);

                tr.commit();
           System.out.println("deleted");

        }catch (Exception e){
            e.printStackTrace();

        }finally{
          //  getSession().close();
        }
    }
}



