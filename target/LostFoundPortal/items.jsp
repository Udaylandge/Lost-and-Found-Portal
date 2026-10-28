<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.lostfound.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lost & Found Items</title>
    <link rel="stylesheet" href="style.css">
    <script>
        function showTab(tabName) {
            document.getElementById("lost").style.display = "none";
            document.getElementById("found").style.display = "none";
            document.getElementById(tabName).style.display = "block";
        }
        function markReturned(id) {
            if (confirm("Are you sure this item has been returned?")) {
                window.location.href = "item?action=delete&id=" + id;
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1>Lost & Found Portal</h1>
    <div class="tabs">
        <button onclick="showTab('lost')">
            Lost Items
        </button>
        <button onclick="showTab('found')">
            Found Items
        </button>
    </div>
    <div id="lost">
        <h2>Lost Items</h2>
        <table>
            <tr>
                <th>Item Name</th>
                <th>Description</th>
                <th>Location</th>
                <th>Contact</th>
                <th>Reported On</th>
                <th>Action</th>
            </tr>
            <%
                try {
                    Connection connection =
                            DBConnection.getConnection();
                    String sql =
                            "SELECT * FROM item " +
                            "WHERE type = ? " +
                            "ORDER BY reported_on DESC";
                    PreparedStatement statement =
                            connection.prepareStatement(sql);
                    statement.setString(1, "Lost");
                    ResultSet result =
                            statement.executeQuery();
                    while (result.next()) {
            %>
            <tr>
                <td>
                    <%= result.getString("item_name") %>
                </td>
                <td>
                    <%= result.getString("description") %>
                </td>
                <td>
                    <%= result.getString("location") %>
                </td>
                <td>
                    <%= result.getString("contact") %>
                </td>
                <td>
                    <%= result.getTimestamp("reported_on") %>
                </td>
                <td>
                <form action="item" method="get"
                     onsubmit="return confirm('Are you sure this item has been returned?');">
                     <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id"
                       value="<%= result.getInt(1) %>">
                     <button type="submit">
                         Mark Returned
                   </button>
                </form>
                </td>
            </tr>
            <%
                    }
                    result.close();
                    statement.close();
                    connection.close();

                }
                catch (Exception e) {
                    out.println(
                        "<p>Error loading lost items: "
                        + e.getMessage()
                        + "</p>"
                    );
                }
            %>
        </table>
    </div>
    <div id="found" style="display:none;">
        <h2>Found Items</h2>
        <table>
            <tr>
                <th>Item Name</th>
                <th>Description</th>
                <th>Location</th>
                <th>Contact</th>
                <th>Reported On</th>
                <th>Action</th>
            </tr>
            <%
                try {
                    Connection connection =
                            DBConnection.getConnection();
                    String sql =
                            "SELECT * FROM item " +
                            "WHERE type = ? " +
                            "ORDER BY reported_on DESC";
                    PreparedStatement statement =
                            connection.prepareStatement(sql);
                    statement.setString(1, "Found");
                    ResultSet result =
                            statement.executeQuery();
                    while (result.next()) {
            %>
            <tr>
                <td>
                    <%= result.getString("item_name") %>
                </td>
                <td>
                    <%= result.getString("description") %>
                </td>
                <td>
                    <%= result.getString("location") %>
                </td>
                <td>
                    <%= result.getString("contact") %>
                </td>
                <td>
                    <%= result.getTimestamp("reported_on") %>
                </td>
                <td>
                    <form action="item" method="get"
                         onsubmit="return confirm('Are you sure this item has been returned?');">
                        <input type="hidden" name="action" value="delete">
                             <input type="hidden" name="id"
                               value="<%= result.getInt(1) %>">
                        <button type="submit">
                              Mark Returned
                        </button>
                    </form>
                </td>
            </tr>
            <%
                    }
                    result.close();
                    statement.close();
                    connection.close();
                }
                catch (Exception e) {
                    out.println(
                        "<p>Error loading found items: "
                        + e.getMessage()
                        + "</p>"
                    );
                }

            %>
        </table>
    </div>
    <br>
    <a href="report.html">Report New Item</a>
</div>
</body>
</html>