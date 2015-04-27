package com.naxsoft.lunchinhell.models;

/**
 * Created by Iouri on 26/04/2015.
 */
public class Restaurant {
    private int id;
    private String name;
    private int votes;

    public Restaurant(int id, String name, int votes) {
        this.id = id;
        this.name = name;
        this.votes = votes;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getVotes() {
        return votes;
    }
}
