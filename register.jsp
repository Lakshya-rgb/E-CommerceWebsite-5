<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="newcss.css" type="text/css"/>
</head>
<body>
    <c:import url="/include/header.jsp" />
    <c:import url="/include/usernavigation.jsp" />
   <c:import url="/include/sitenavigation.jsp" />
     <div class="content">
         <h3> Register here:</h3>
         <br>
         <table>
             <tr>   
                 <td></td>
                 <td></td>
                 <td>
            <form class="regis" name="register" action="LoginController" method="POST">
            First name:<br>
            <input type="text" name="firstname" required>
            <br>
            Last name:<br>
            <input type="text" name="lastname">
            <br>
            Email Address:<br>
            <input type="email" name="emailAddress" required>
            <br>
            Address 1:<br>
            <input type="text" name="address1" required>
            <br>
            Address 2:<br>
            <input type="text" name="address2">
            <br>
            City<br>
            <input type="text" name="city">
            <br>
            State<br>
            <input type="text" name="state">
            <br>
            PostCode<br>
            <input type="text" name="postCode" required>
            <br>
            Country<br>
            <input type="text" name="country">
            <br>
            Password<br>
            <input type="password" name="password" required>
            <br>
            Re-enter Password<br>
            <input type="password" name="password_match" required>
            <br><br>
            <input id="buton" type="submit" value="Register" name="register">
            <button id="buton" type="submit" value="back"><a href="checkoutChoice.jsp">Back</a>
            </form>
                   
                 </td>
                
                       
             </tr>
         </table>
    
         <b style="text-align: center; font-size: 20px">
   <%
       String message1= (String) session.getAttribute("Message");
       if(message1!=null){
 
       out.println(message1);
       }
       
       %>
         </b>
         
        </div>
       
     <c:import url="/include/footer.jsp" />
</body>
</html>