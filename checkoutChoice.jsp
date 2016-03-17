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
                <h2> Login or create User</h2>
                
                <p>Select one of the two options to proceed with checkout</p>
                <br><br>
                <table>
            <tr><% session.setAttribute("Message", null); %>
                            <td></td>
                            <td></td>
                            <td><button id="checkout" type="button" value="Login" onclick="location.href='login.jsp'">Login as Existing User</button></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td><button id="checkout" type="button" value="Register" onclick="location.href='register.jsp'">Create New User</button></td>
                                
                            </tr>
                </table>
            </div>
      
        <c:import url="/include/footer.jsp" />
    </body>
    
</html>


