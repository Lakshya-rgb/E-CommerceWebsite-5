<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
    
        <title>Fashionera</title>
        <link rel="stylesheet" type="text/css" href="newcss.css">

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    
    <body>	
        <c:import url="/include/header.jsp" />
        <c:import url="/include/usernavigation.jsp" />
        <c:import url="/include/sitenavigation.jsp" />
        
        
            
            <div class="content">
            <form class="login" name="login" action="LoginController" method="POST">
            
            Email Address:
            <input type="email" name="email" required>
            <br>
            <br>
            Password:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <input type="password" name="password" required>
            <br>
            <br>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <input id="buton" type="submit" value="login" name="Login">
            
            </form>
               
                <%
       String message1= (String) session.getAttribute("Message");
       if(message1!=null){
 
       out.println(message1);
       }
       
       %>
            </div>
      
        <c:import url="/include/footer.jsp" />
    </body>
    
</html>

