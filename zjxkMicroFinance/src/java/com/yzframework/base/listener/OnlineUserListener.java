package com.yzframework.base.listener;

import java.net.InetAddress;
import java.util.HashSet;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class OnlineUserListener implements HttpSessionListener {

	protected final Log logger = LogFactory.getLog(getClass());

	/*
	 * 功能描述：Session创建时处理
	 */
	@Override
	public void sessionCreated(final HttpSessionEvent event) {
		try {
			final HttpSession session = event.getSession();
			InetAddress addr = InetAddress.getLocalHost();
			String ip = addr.getHostAddress().toString();
			session.setAttribute("ip", ip);
			logger.info("SESSION创建,sessionID=" + session.getId());
		} catch (Exception e) {
			logger.error("SESSION创建失败", e);
		}
	}

	/*
	 * 功能描述：Session失效时处理
	 */
	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		try {
			final HttpSession session = event.getSession();
			ServletContext application = session.getServletContext();
			@SuppressWarnings("unchecked")
			HashSet<HttpSession> logonUserSessions = (HashSet<HttpSession>) application
					.getAttribute("logonUserSessions");
			if (logonUserSessions != null) {
				logonUserSessions.remove(session);
			}
			logger.info("用户退出,用户名=" + session.getAttribute("userId"));
			logger.info("SESSION销毁,sessionID=" + session.getId());
		} catch (Exception e) {
			logger.error("SESSION销毁失败", e);
		}
	}
}
