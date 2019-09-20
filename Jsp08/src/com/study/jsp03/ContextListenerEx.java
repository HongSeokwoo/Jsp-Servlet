package com.study.jsp03;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

    @WebListener
    public class ContextListenerEx implements ServletContextListener {
	public ContextListenerEx() {
		
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		System.out.println("���ø����̼� ����");
	}
	
	@Override
	public void contextInitialized(ServletContextEvent event) {
		System.out.println("���ø����̼� ����");
		
		//Ex#1
		ServletContext sc = event.getServletContext();
		sc.setAttribute("schedule", 1000);
	}
	
	// �ٸ� �ۿ��� ������ ���� ��� ����
	/*
	 int nTime = request.getSession().getServletContext().getArrivute("schedule");
	 */
	
	// ���� ������ ���ø����̼� ���Ű� ���. (���� �ʰ� ����)
}
