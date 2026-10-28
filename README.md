# Lost & Found Portal

A simple web-based Lost & Found Portal developed as a Java/J2EE case study.

The application allows users to report lost or found items and view them in separate Lost and Found tabs. Users can also mark an item as returned, which removes the record from the database.

## Features

- Report a lost or found item
- Item fields:
  - Item Name
  - Description
  - Location
  - Lost / Found type
  - Contact
- JavaScript form validation
- Separate Lost Items and Found Items tabs
- Filter records by item type
- Display reported date and time
- Mark an item as returned
- MySQL database integration
- JDBC `PreparedStatement` for database operations
- Simple responsive HTML/CSS interface

## Technology Stack

### Frontend

- HTML5
- CSS3
- JavaScript

### Backend

- Java
- Servlet
- JSP
- JDBC

### Database

- MySQL

### Server / Build

- Apache Tomcat 9
- Maven

## Project Structure

```text
Lost&Found/
├── pom.xml
├── database.sql
└── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── lostfound/
        │           ├── DBConnection.java
        │           └── ItemServlet.java
        └── webapp/
            ├── report.html
            ├── items.jsp
            ├── style.css
            ├── script.js
            └── WEB-INF/
                └── web.xml