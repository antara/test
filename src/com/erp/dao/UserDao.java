package com.erp.dao;

import com.erp.pojo.User;
import com.erp.exception.LoginException;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 14, 2012
 * Time: 12:47:56 PM
 * To change this template use File | Settings | File Templates.
 */
public interface UserDao {
      public void authenticate(User u) throws LoginException ;
	   public boolean SaveUser(User u);
    public User findById(Long id);
    public void update(User user);
      public List getUser();
    void delete(User user);
}
