<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*, mypack.dbconnect" %>
<%
      int sno = 1;
      String bldGroup=request.getParameter("bldGroup");
      String location=request.getParameter("location");
%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Search Blood</title>
  </head>
  <body>
    <div class="table" style="width: 80%;">
    <table class="table table-dark table-striped" style="margin-left: 170px; margin-top: 50px;">
      <thead>
        <tr>
          <th scope="col">Sno</th>
          <th scope="col">Moblie Number</th>
          <th scope="col">Name</th>
          <th scope="col">Blood Group</th>
          <th scope="col">Location</th>
        </tr>
      </thead>
      <tbody>
      <%
      try
      {
          Connection con = dbconnect.initializeDatabase();
          Statement stmt = con.createStatement();

          String sql = "SELECT * FROM newdonor WHERE BloodGroup = '"+bldGroup+"' AND Location = '"+location+"'";
          ResultSet rs = stmt.executeQuery(sql);
          // Close all the connections
          while(rs.next())
          {%>
            <tr>
              <th scope="row"><%= sno %></th>
              <td><%= rs.getString("MobileNum") %></td>
              <td><%= rs.getString("Dname") %></td>
              <td><%= rs.getString("BloodGroup") %></td>
              <td><%= rs.getString("Location") %></td>
            </tr>
          <% sno = sno + 1 ;}
      }
      catch (SQLException se) 
      {%>
          <%= se.getMessage() %>
      <%}
      %>
      </tbody>
    </table>
    </div>
    <a href="index.jsp" class="btn btn-primary" style="margin-left: 100vh;">Back</a>
    <!-- Optional JavaScript; choose one of the two! -->
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>