package com.erp.guice;

import com.google.inject.Injector;

import javax.servlet.ServletContext;

import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.controller.ExecutionContext;
import net.sourceforge.stripes.controller.Interceptor;
import net.sourceforge.stripes.controller.LifecycleStage;
import net.sourceforge.stripes.controller.Intercepts;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

/**
 * Created by IntelliJ IDEA.
 * User: Ashay
 * Date: Jan 23, 2012
 * Time: 10:43:19 AM
 * To change this template use File | Settings | File Templates.
 */
@Intercepts(LifecycleStage.ActionBeanResolution)
public class GuiceInterceptor implements Interceptor {


    public Resolution intercept(ExecutionContext context) throws Exception {
        Resolution resolution = context.proceed();
        System.out.println("GuiceInterceptor");
        ServletContext ctx = context.getActionBeanContext().getServletContext();
        Injector injector = (Injector) ctx.getAttribute(GuiceServletContextListener.KEY);
        injector.injectMembers(context.getActionBean());

        return resolution;
    }
}