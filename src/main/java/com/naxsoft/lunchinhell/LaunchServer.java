package com.naxsoft.lunchinhell;

import com.naxsoft.lunchinhell.handlers.RestaurantHandler;
import com.naxsoft.lunchinhell.handlers.UserHandler;
import org.eclipse.jetty.server.Request;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.ServletHolder;
import org.glassfish.jersey.jetty.JettyHttpContainerFactory;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.servlet.ServletContainer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.UriBuilder;
import java.net.URI;

/**
 * Created by Iouri on 26/04/2015.
 */
public class LaunchServer {

    private static void route(String target, Request baseRequest, HttpServletRequest request, HttpServletResponse response) {
        try {

        } catch (Exception e) {
            handleError(e);
        }
    }

    private static void handleError(Exception e) {

    }

    public static void main(String[] args)  {
//        Server httpServer = new Server(8080);
//        ContextHandler contextHandler = new ContextHandler("/");
//        contextHandler.setHandler(new AbstractHandler() {
//            @Override
//            public void handle(String target, Request baseRequest, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//                route(target, baseRequest, request, response);
//            }
//        });
//        httpServer.setHandler(contextHandler);
//        httpServer.start();
//        httpServer.join();

        try {
            Class.forName("org.postgresql.Driver");

//            ResourceConfig appConfig = new ResourceConfig();
//            appConfig.setApplicationName("LunchServer");
//            appConfig.registerClasses(UserHandler.class);
//            appConfig.registerClasses(RestaurantHandler.class);
//            URI baseUri = UriBuilder.fromUri("http://localhost/").port(8080).build();
//            Server server = JettyHttpContainerFactory.createServer(baseUri, ResourceConfig.forApplication(appConfig), false);
//
//            ServletHolder sh = new ServletHolder(ServletContainer.class);
//            ServletContextHandler context = new ServletContextHandler(server, "/", ServletContextHandler.SESSIONS);
//            context.addServlet(sh, "/*");
//
//            server.start();
//            server.join();

            Server server = new Server(8080);

            ServletContextHandler context = new ServletContextHandler(ServletContextHandler.SESSIONS);
            context.setContextPath("/");

            server.setHandler(context);

            ServletHolder jerseyServlet = context.addServlet(ServletContainer.class, "/*");
            jerseyServlet.setInitOrder(0);

            /*This parameter tells the Jersey Servlet which of your REST resources to load. In this example we're adding the TestResource class. Jersey will then invoke this class for requests coming into paths denoted by the @Path parameter within the TestResource class. If you have multiple classes, you can either list them all comma separated, of use "jersey.config.server.provider.packages" and list the package name instead */
            jerseyServlet.setInitParameter("jersey.config.server.provider.packages",  "com.naxsoft.lunchinhell.handlers");
            server.start();
            server.join();


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
