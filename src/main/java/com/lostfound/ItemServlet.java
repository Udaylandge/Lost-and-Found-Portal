package com.lostfound;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/item")
public class ItemServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {
        String itemName = request.getParameter("item_name");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        String type = request.getParameter("type");
        String contact = request.getParameter("contact");
        String sql = "INSERT INTO item " +
                     "(item_name, description, location, type, contact) " +
                     "VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, itemName);
            statement.setString(2, description);
            statement.setString(3, location);
            statement.setString(4, type);
            statement.setString(5, contact);
            statement.executeUpdate();
            response.sendRedirect("items.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(
                "Error while saving item: " + e.getMessage()
            );
        }
    }
    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            String id = request.getParameter("id");
            String sql = "DELETE FROM item WHERE id = ?";
            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement =
                         connection.prepareStatement(sql)) {
                statement.setInt(1, Integer.parseInt(id));
                statement.executeUpdate();
                response.sendRedirect("items.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println(
                    "Error while deleting item: " + e.getMessage()
                );
            }

        } else {
            response.sendRedirect("items.jsp");
        }
    }
}