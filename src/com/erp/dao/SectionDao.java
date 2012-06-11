package com.erp.dao;

import com.erp.pojo.Section;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 14, 2012
 * Time: 12:43:56 PM
 * To change this template use File | Settings | File Templates.
 */
public interface SectionDao {
     public List getSection();
    public boolean SaveSection(Section section);
    public void delete(Section section);
     public void update(Section section);
    public Section findById(Long id);
    
}
