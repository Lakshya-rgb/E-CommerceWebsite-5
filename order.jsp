<%@page import="Beans.Product"%>
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
                <div class="invoice">
             <%
			Order currentOrder = (Order) request.getSession().getAttribute("currentOrder");
                        if(currentOrder==null){
                        out.println("No orders");
                        }
                        else{
                         
		%>
		<h3>Invoice :</h3>
		<p>
			Ship To/Bill To: <br />
			<%=currentOrder.getUser().getFirstName()%>
			<%=currentOrder.getUser().getLastName()%><br />
			<%=currentOrder.getUser().getAddress1()%><br />
			<%=currentOrder.getUser().getAddress2()%><br />
			<%=currentOrder.getUser().getCity()%>,
			<%=currentOrder.getUser().getState()%>
			<br />
			<%=currentOrder.getUser().getPostCode()%>,
			<%=currentOrder.getUser().getCountry()%>
		</p>
       <table class="table">
                    <thead>
                        <tr>
				<th>Item</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total</th>
			</tr>
                    </thead>
                    <tbody>
                         <%
				double subTotalPrice = 0.0;
				for (int i = 0; i < currentOrder.getOrderitem().size(); i++) {
					Product cartItem = currentOrder.getOrderitem().get(i)
							.getProduct();
			%>
			<tr>
				<td><a href="product?productCode=<%=cartItem.getProductCode()%>"><%=cartItem.getProductName()%></a></td>
				<td>$<%=cartItem.getPrice()%></td>
				<td><%=currentOrder.getOrderitem().get(i).getQuantity()%></td>
				<td>$<%=(currentOrder.getOrderitem().get(i).getItemTotalPrice())%></td>
			</tr>
			<%
				subTotalPrice += currentOrder.getOrderitem().get(i).getItemTotalPrice();
				}
			%>
                        </tbody>
                        <tfoot>
			<tr>
				<td></td>
				<td></td>
				<td>Sub Total</td>
				<td>$<%=subTotalPrice%></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>Tax(=15%)</td>
				<td>$<%=currentOrder.getTaxRate()%></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>Total</td>
				<td>$<%=currentOrder.getTotalCost()%></td>
			</tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td><button id="main_but" type="button" value="Purchase" onclick="location.href='purchase'">Purchase</button></td>
                            <td><button id="main_but" type="button" value="Back To Cart" onclick="location.href='cart'">Back To Cart</button></td>
                        </tr>
                        </tfoot>
		</table>
                 <%
                                
                      }
                        %>   
                </div>
                      
            </div>
                      
         <c:import url="/include/footer.jsp" />
                </body>
</html>