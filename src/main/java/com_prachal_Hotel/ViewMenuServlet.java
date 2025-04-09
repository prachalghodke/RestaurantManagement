package com_prachal_Hotel;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/ViewServlet")
public class ViewMenuServlet extends GenericServlet {

    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        try {
            // DB Connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "prachal");

            // Get all menu items
            MenuDAO dao = new MenuDAO(con);
            List<MenuItem> menuList = dao.getAllMenuItems();

            // Set attribute and forward to JSP
            request.setAttribute("menuList", menuList);
            RequestDispatcher rd = request.getRequestDispatcher("viewMenus.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
