package com.erp.dao;

import com.erp.pojo.Role;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Feb 24, 2012
 * Time: 3:16:08 PM
 * To change this template use File | Settings | File Templates.
 */
public interface RoleDao {
    public List getRole();
    public boolean SaveRole(Role section);
    public Role findById(Long id);
    void delete(Role role);
    void update(Role role);
}
