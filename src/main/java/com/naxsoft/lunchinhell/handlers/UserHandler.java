package com.naxsoft.lunchinhell.handlers;

import com.naxsoft.lunchinhell.Database;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.*;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@Path("/users/")
@Produces("application/json")
public class UserHandler {
    @GET
    @Path("/id/{username}")
    public Response get(@PathParam("username") String userName) {
        return Response.ok().entity("test").build();
    }

    @POST
    @Path("/new")
    @Consumes("application/x-www-form-urlencoded")
    public Response newUser(@Context UriInfo ui, @FormParam("username") String userName, @FormParam("password") String password) throws Exception {
        try {
            Connection connection = new Database().getConnection();
            String sql = "INSERT INTO users(id, username, pwd) VALUES (DEFAULT, ?, ?);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, password);
            int rc = st.executeUpdate();
            st.close();
            connection.close();
            Response response;

            if (0 != rc) {
                response = Response.status(Response.Status.CREATED).build();
            } else {
                response = Response.status(Response.Status.SERVICE_UNAVAILABLE).build();
            }
            return response;
        } catch (Exception e) {
            return Response.status(Response.Status.SERVICE_UNAVAILABLE).entity(Entity.json(e.toString())).build();
        }
    }

    @POST
    @Path("/login")
    @Consumes("application/x-www-form-urlencoded")
    public Response login(@Context HttpServletRequest req, @FormParam("username") String userName, @FormParam("password") String password) throws Exception {
        try {
            Connection connection = new Database().getConnection();
            String sql = "SELECT users.id FROM users WHERE users.username = ? and users.pwd = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            Response response;
            if(rs.next()) {
                HttpSession session = req.getSession(true);
                session.setAttribute("userid", rs.getInt(1));
                response = Response.status(Response.Status.OK).entity("OK").build();
            } else {
                response =  Response.status(Response.Status.NOT_FOUND).build();
            }
            rs.close();
            st.close();
            connection.close();
            return response;
        } catch (Exception e) {
            return Response.status(Response.Status.SERVICE_UNAVAILABLE).entity(e).build();
        }
    }
}
