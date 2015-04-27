package com.naxsoft.lunchinhell;

import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.SessionManager;
import org.eclipse.jetty.server.session.HashSessionManager;
import org.eclipse.jetty.server.session.SessionHandler;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.ServletHolder;
import org.glassfish.jersey.servlet.ServletContainer;

public class LaunchServer {
    public static void main(String[] args)  {
        try {
            Class.forName("org.postgresql.Driver");
            Server server = new Server(8080);

            SessionManager sessionManager = new HashSessionManager();
            SessionHandler sessionHandler = new SessionHandler(sessionManager);

            ServletContextHandler context = new ServletContextHandler(ServletContextHandler.SESSIONS);
            context.setContextPath("/");
            context.setSessionHandler(sessionHandler);

            server.setHandler(context);

            ServletHolder jerseyServlet = context.addServlet(ServletContainer.class, "/*");
            jerseyServlet.setInitOrder(0);

            jerseyServlet.setInitParameter("jersey.config.server.provider.packages",  "com.naxsoft.lunchinhell.handlers");
            server.start();
            server.join();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
