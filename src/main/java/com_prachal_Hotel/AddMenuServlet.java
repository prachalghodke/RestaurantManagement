package com_prachal_Hotel;


import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/AddMenuServlet")
public class AddMenuServlet extends GenericServlet {

    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Get form data
        	System.out.println("AddMenuServlet.service()");
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String type = request.getParameter("type");
            float price = Float.parseFloat(request.getParameter("price"));
            String availability = request.getParameter("availability");
            String imageName = request.getParameter("image_name");

            // Set values into MenuItem bean
            MenuItem item = new MenuItem();
            item.setId(id);
            item.setName(name);
            item.setType(type);
            item.setPrice(price);
            item.setAvailability(availability);
            item.setImageName(imageName);

            // DB Connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "prachal");
            

            // Insert using DAO
            MenuDAO dao = new MenuDAO(con);
            int result = dao.addMenuItem(item);
            System.out.println("result is :"+result);
            if (result > 0) {
                RequestDispatcher rd = request.getRequestDispatcher("ViewServlet");
                rd.forward(request, response);
            } else {
                out.println("Failed to insert menu item.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    }
}