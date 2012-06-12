package com.erp.action;

/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Jun 11, 2012
 * Time: 11:54:38 AM
 * To change this template use File | Settings | File Templates.
 */
public class newActionBean extends BaseActionBean{
    String test;
    String b;

    public String getB() {
        return "abc";
    }

    public void setB(String b) {
        this.b = b;
    }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;

    }
  
    public String mtd()
    {
        b="abc";
        test="def";
        b=b+test;
        return b;
    }
}
