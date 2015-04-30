package com.naxsoft.lunchinhell;

import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.SessionManager;
import org.eclipse.jetty.server.session.HashSessionManager;
import org.eclipse.jetty.server.session.SessionHandler;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.ServletHolder;
import org.glassfish.jersey.servlet.ServletContainer;

import java.io.FileReader;
import java.io.PrintWriter;
import java.sql.Connection;

public class LaunchServer {
    public static void main(String[] args)  {
        try {
            Class.forName("org.postgresql.Driver");

            //initDatabase();

            int port = 8080;
            String customPort = System.getenv("PORT");
            if (null != customPort) {
                port = Integer.parseInt(customPort);
            }

            Server server = new Server(port);

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

    private static void initDatabase() {
        try {
            Connection connection = new Database().getConnection();
            ScriptRunner sr = new ScriptRunner(connection, false, true);
            sr.setErrorLogWriter(new PrintWriter(System.out));
            sr.setLogWriter(new PrintWriter(System.out));
            sr.runScript(new FileReader("database.sql"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
