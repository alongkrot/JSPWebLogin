<%@page import="java.sql.*"%>
<%
    String e = request.getParameter("email");
    String p = request.getParameter("password");
    if(e != null && p!= null){
        String url ="jdbc:mysql://35.198.196.2/web"+
                    "?user=james&password=bond";
        String sql = "select * from member where "+
                     "email=? and password=sha2(?, 512)";
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection(url);
   PreparedStatement ps = conn.prepareStatement(sql);
   ps.setString(1, e);
   ps.setString(2, p);
   ResultSet rs = ps.executeQuery();
   if(rs.next()){
   String name = rs.getString("name");
   session.setAttribute("user",name);
   int id = rs.getInt("id");
   session.setAttribute("id",id);
   response.sendRedirect("profile.jsp");
   }else{
   response.sendRedirect("index.jsp");}
   rs.close();ps.close();conn.close();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport"
              content="width=device-width.initial-scale=1">
        <title>LOGIN JSP</title>
        <link rel="stylesheet"
              href="css/bootstrap.css" >
        <style>
                form { box-shadow: 0 0 4px gray;
                       margin: 10px auto;
                       padding: 10px; background: white;
                       border-radius: 8px;
                       max-width: 320px; 
                       text-align : center;}
                input { margin-bottom: 10px; }
                body { background: #f5f5ff; }
        </style>
    </head>
    <body>
        <div class="container">
            <form method="post">
                <h1>LOGIN</h1>
                <input name="email" placeholder="Email"
                       class="form-control" autofocus>
                <input name="password" placeholder="Password"
                       class="form-control" type="password">
                <button class="btn btn-primary">Log In</button>
            </form>
        </div>
    </body>
</html>


