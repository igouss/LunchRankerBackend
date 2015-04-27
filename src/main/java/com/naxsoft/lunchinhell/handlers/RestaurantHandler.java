package com.naxsoft.lunchinhell.handlers;

import com.google.gson.Gson;
import com.naxsoft.lunchinhell.Database;
import com.naxsoft.lunchinhell.models.Restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

@Path("/restaurant")
@Produces("application/json")
public class RestaurantHandler {
    @GET
    @Path("/votes")
    public Response votes(@Context HttpServletRequest req) {
        List<Restaurant> restaurants = new LinkedList<Restaurant>();
        Gson gson = new Gson();

        String sql = "SELECT \n" +
                "  restaurant.id, \n" +
                "  restaurant.name, \n" +
                "  sum(votes.vote)\n" +
                "FROM \n" +
                "  lunch.restaurant, \n" +
                "  lunch.votes\n" +
                "WHERE \n" +
                "  restaurant.id = votes.restaurantid\n" +
                "AND\n" +
                "  lunch.votes.date = current_date  \n" +
                "GROUP BY \n" +
                "  restaurant.id;";

        try {
            Connection connection = new Database().getConnection();
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next())
            {
                Restaurant r = new Restaurant(rs.getInt(1), rs.getString(2), rs.getInt(3));
                restaurants.add(r);
            }
            rs.close();
            st.close();
            connection.close();
            String result = gson.toJson(restaurants);
            return Response.ok().entity(result).build();
        } catch (SQLException e) {
            e.printStackTrace();
            return Response.status(Response.Status.SERVICE_UNAVAILABLE).build();
        }
    }

    @GET
    @Path("/list")
    public Response list(@Context HttpServletRequest req) {
        try {
            List<Restaurant> restaurants = new LinkedList<Restaurant>();
            Gson gson = new Gson();
            HttpSession session = req.getSession(false);
            Integer userId = (Integer) session.getAttribute("userid");

            String sql = "select r.id, r.name, sum(v.vote) as vote\n" +
                    "from \n" +
                    "  (select restaurant.id, restaurant.name from lunch.restaurant) as r\n" +
                    "  \n" +
                    "LEFT OUTER JOIN (select voteid, restaurantid, vote from lunch.votes where lunch.votes.date = current_date and lunch.votes.userid = " + userId + " ORDER BY  restaurantid) as v\n" +
                    "ON r.id = v.restaurantid\n" +
                    "GROUP BY r.id, r.name\n" +
                    "ORDER BY r.name";

            Connection connection = new Database().getConnection();
            Statement st = connection.createStatement();
//            st.setInt(1, userId);
            ResultSet rs = st.executeQuery(sql);
            while (rs.next())
            {
                Restaurant r = new Restaurant(rs.getInt(1), rs.getString(2), rs.getInt(3));
                restaurants.add(r);
            }
            rs.close();
            st.close();
            connection.close();
            String result = gson.toJson(restaurants);
            return Response.ok().entity(result).build();
        } catch (Exception e) {
            e.printStackTrace();
            return Response.status(Response.Status.SERVICE_UNAVAILABLE).build();
        }
    }


    @POST
    @Path("/vote")
    @Consumes("application/x-www-form-urlencoded")
    public  Response vote(@Context HttpServletRequest req, @FormParam("restaurantId") String restaurantId, @FormParam("vote") int vote) {
        Integer userId = (Integer) req.getSession(false).getAttribute("userid");
        if (null != userId) {
            try {
                Connection connection = new Database().getConnection();
                String deleteSql = "DELETE FROM lunch.votes WHERE lunch.votes.date = current_date AND votes.userid = ? and votes.restaurantid = ?;";
                PreparedStatement st1 = connection.prepareStatement(deleteSql);
                st1.setInt(1, userId.intValue());
                st1.setInt(2, Integer.parseInt(restaurantId));
                st1.executeUpdate();
                st1.close();

                String sql = "INSERT INTO lunch.votes(restaurantid, userid, date, vote) VALUES (?, ?, current_date, ?);";
                PreparedStatement st2 = connection.prepareStatement(sql);
                st2.setInt(1, Integer.parseInt(restaurantId));
                st2.setInt(2, userId.intValue());
                st2.setInt(3, vote);
                st2.executeUpdate();
                st2.close();

                connection.close();
                return Response.ok().build();
            } catch (Exception e) {
                return Response.status(Response.Status.SERVICE_UNAVAILABLE).build();
            }
        } else {
            return Response.status(Response.Status.UNAUTHORIZED).build();
        }
    }

    @GET
    @Path("/result")
    public  Response vote() {
            try {
                List<Restaurant> restaurants = new LinkedList<Restaurant>();
                Gson gson = new Gson();

                Connection connection = new Database().getConnection();
                String sql = "select restaurant.id, restaurant.name, sum(votes.vote) as vote\n" +
                        "from lunch.restaurant\n" +
                        "inner join lunch.votes\n" +
                        "on lunch.restaurant.id = lunch.votes.restaurantid\n" +
                        "where votes.date = current_date\n" +
                        "group by restaurant.id, restaurant.name\n" +
                        "order by vote DESC";
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next())
                {
                    Restaurant r = new Restaurant(rs.getInt(1), rs.getString(2), rs.getInt(3));
                    restaurants.add(r);
                }
                rs.close();
                st.close();
                connection.close();
                String result = gson.toJson(restaurants);
                return Response.ok().entity(result).build();
            } catch (Exception e) {
                return Response.status(Response.Status.SERVICE_UNAVAILABLE).build();
            }
    }
}
