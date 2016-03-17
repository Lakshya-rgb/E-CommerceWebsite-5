<%@page import="PersistentData.OrderDB"%>
<%@page import="Beans.User"%>
<%@page import="java.util.List"%>
<%@page import="Beans.Order"%>
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
                <h3>Orders List</h3>
            <%
                OrderDB order = new OrderDB();
                List<Order> orderList=null;
try{
                orderList = order.getOrderList((User) request.getSession().getAttribute("theUser"));
                
}catch(Exception e){
    response.sendRedirect("login");
}

                if (orderList
                        != null) {
            %>
            <table  class="table">
                <thead>
                    <tr>
                        <th>Order Number</th>
                        <th>Order Date</th>
                        <th>Order Amount</th>
                    </tr></thead>
                <tbody>
                    <%
                        for (Order order1 : orderList) {

                    %>
                    <tr>
                        <td><%=order1.getOrderNumber()%></td>
                        <td><%=order1.getDate()%></td>
                        <td>$<%=order1.getTotalCost()%></td>
                    </tr>
                </tbody>
                <tfoot></tfoot>
                <%
                }%>
            </table>
            <%} else {
            %>
            <p> No Orders Yet..!</p>
            <%
                }
            %>
            </div>
      
        <c:import url="/include/footer.jsp" />
    </body>
    
</html>


