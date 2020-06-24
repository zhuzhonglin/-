package org.ywjava.linstener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class MyRequestListener
 *
 */
//@WebListener
public class MyRequestListener implements ServletRequestListener {

    /**
     * Default constructor. 
     */
    public MyRequestListener() {
        //System.out.println("MyRequestListener() -->");
    }

	/**
     * @see ServletRequestListener#requestDestroyed(ServletRequestEvent)
     */
    public void requestDestroyed(ServletRequestEvent arg0)  { 
    	//System.out.println("requestDestroyed() -->请求被销毁");
    }

	/**
     * @see ServletRequestListener#requestInitialized(ServletRequestEvent)
     */
    public void requestInitialized(ServletRequestEvent arg0)  { 
    	//System.out.println("requestInitialized() -->请求被创建");
    }
	
}
