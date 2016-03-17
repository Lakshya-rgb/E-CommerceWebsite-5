<%@page import="Beans.Product"%>
<%@page import="Beans.Cart"%>
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
                <%
			if (request.getSession().getAttribute("theShoppingCart") != null) {
				Cart shoppingCart = (Cart) request.getSession().getAttribute(
						"theShoppingCart");
				if (shoppingCart.getListOfOrderItem() != null
						&& shoppingCart.getListOfOrderItem().size() > 0) {
		%>
                <div class="col1"><h2>Your cart</h2></div>
                <div class="col2">To remove an item, change quantity to zero.</div>
                <div class="table">
                    <form name="cartForm" method="post">
            <table class="table">
                <tr><td>
                        <h3>My Shopping Cart</h3></td><td>To remove an item, change the quantity to zero</td></tr></table>
            <div>
                <table  class="table">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Unit Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr></thead>
                    <tbody>
                       <%
					double subTotalPrice = 0.0;
							for (int i = 0; i < shoppingCart.getListOfOrderItem()
									.size(); i++) {
								Product cartItem = shoppingCart.getListOfOrderItem()
										.get(i).getProduct();
				%>
                <tr>
                    
                   <input type="hidden" name="productCode" value="<%=cartItem.getProductCode()%>" />
                    <td><a href="product?productCode=<%=cartItem.getProductCode()%>"><%=cartItem.getProductName()%></a></td>
                    <td>$<%=cartItem.getPrice()%></td>
                    <td><input name="productQuantity" type="text" value="<%=shoppingCart.getListOfOrderItem().get(i).getQuantity()%>"/></td>
                    <<td>$<%=(shoppingCart.getListOfOrderItem().get(i).getTotal(cartItem.getPrice(),shoppingCart.getListOfOrderItem().get(i).getQuantity()))%></td>
		</tr>
                    <%subTotalPrice = subTotalPrice+(shoppingCart.getListOfOrderItem().get(i).getItemTotalPrice());}%>
		
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
                    <td><button id="main_but" type="submit" value="Checkout"
                                onclick="document.cartForm.action='cart?action=checkout'">Check Out</button></td>
                    <td><button id="main_but" type="submit" value="Update Cart"
                                onclick="document.cartForm.action='cart?action=updateCart'">Update Cart</button></td>
                </tr>
                </tfoot>
                    </table>
                </div>
            </form>
                        <%
			} else {
		%>
                <p>
			 No items in your cart</p>
		<%
			}
			} else {
		%>
                <p>
			No items in your cart</p>
		<%
			}
		%>
        </div>
             
        
            </div>
        <c:import url="/include/footer.jsp" />
    </body>
</html>
