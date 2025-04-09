package com_prachal_Hotel;

import java.sql.*;
import java.util.*;

public class MenuDAO {
    Connection con=null;

    public MenuDAO(Connection con) {
        this.con = con;
    }

    public int addMenuItem(MenuItem item) throws Exception {
        PreparedStatement ps = con.prepareStatement("INSERT INTO menu VALUES (?, ?, ?, ?, ?, ?)");
        ps.setInt(1, item.getId());
        ps.setString(2, item.getName());
        ps.setString(3, item.getType());
        ps.setFloat(4, item.getPrice());
        ps.setString(5, item.getAvailability());
        ps.setString(6, item.getImageName());
        return ps.executeUpdate();
    }

    public List<MenuItem> getAllMenuItems() throws Exception {
        List<MenuItem> list = new ArrayList<>();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM menu");

        while (rs.next()) {
            MenuItem item = new MenuItem();
            item.setId(rs.getInt("ID"));
            item.setName(rs.getString("NAME"));
            item.setType(rs.getString("TYPE"));
            item.setPrice(rs.getFloat("PRICE"));
            item.setAvailability(rs.getString("AVAILABILITY"));
            item.setImageName(rs.getString("IMAGENAME"));
            list.add(item);
        }
        return list;
    }
}
