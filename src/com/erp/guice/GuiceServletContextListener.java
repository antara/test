package com.erp.guice; /**
 * Created by IntelliJ IDEA.
 * User: Ashay
 * Date: Jan 23, 2012
 * Time: 10:44:43 AM
 * To change this template use File | Settings | File Templates.
 */

import com.google.inject.Injector;
import com.google.inject.Guice;


import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionBindingEvent;

public class GuiceServletContextListener implements ServletContextListener,
        HttpSessionListener, HttpSessionAttributeListener {

    public static final String KEY = Injector.class.getName();
    // Public constructor is required by servlet spec
    public GuiceServletContextListener() {
        System.out.println("guice context listener");

    }

    // -------------------------------------------------------
    // ServletContextListener implementation
    // -------------------------------------------------------
    public void contextInitialized(ServletContextEvent sce) {
        /* This method is called when the servlet context is
           initialized(when the Web application is deployed).
           You can initialize servlet context related data here.
        */
        System.out.println("guice context init");
        sce.getServletContext().setAttribute(KEY, getInjector(sce.getServletContext()));
    }

    public void contextDestroyed(ServletContextEvent sce) {
        /* This method is invoked when the Servlet Context
           (the Web application) is undeployed or
           Application Server shuts down.
        */
        System.out.println("guice context destroyed");
         sce.getServletContext().removeAttribute(KEY);
    }

    // -------------------------------------------------------
    // HttpSessionListener implementation
    // -------------------------------------------------------
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
    }

    // -------------------------------------------------------
    // HttpSessionAttributeListener implementation
    // -------------------------------------------------------

    public void attributeAdded(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute
           is added to a session.
        */
    }

    public void attributeRemoved(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute
           is removed from a session.
        */
    }

    public void attributeReplaced(HttpSessionBindingEvent sbe) {
        /* This method is invoked when an attibute
           is replaced in a session.
        */
    }

    private Injector getInjector(ServletContext ctx) {
        try {

        System.out.println("injector returned");
            return Guice.createInjector(new RegistrationModule());
        } catch (Exception e) {
            System.out.println("injector not returned");
            throw new RuntimeException(e);
        }
    }
}
