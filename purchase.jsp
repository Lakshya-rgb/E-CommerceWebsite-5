
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
        
        
            <div class="content"
            <%
                Order currentOrder = (Order) request.getSession().getAttribute(
                        "currentOrder");
                if (currentOrder == null) {
                    response.sendRedirect("cart");
                }
            %>
                 <h2>Enter your payment information here</h2><br>
                <hr>
                
            <form name="paymentForm" method="post"
                  action="purchase?action=confirmOrder"> 
                    <table> 
                        <tr>
                            <td> Credit Card Type </td>
                            <td><select>
                                    <option>Visa</option>
                                    <option>Master Card</option>
                                    <option>American Express</option>
                                  </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Card Number </td>
                            <td><input type="number" name="cardnum" required> </td>
                        </tr>
                        <tr>
                            <td>Expiration Date (MM/YYYY) </td>
                         <td> 
                             <select>
                            <option>Jan</option>
                            <option>Feb</option>
                            <option>Mar</option>
                          <option>Apr</option>
                            <option>May</option>
                            <option>Jun</option>
                          <option>Jul</option>
                            <option>Aug</option>
                            <option>Sep</option>
                          <option>Oct</option>
                            <option>Nov</option>
                            <option>Dec</option>
                            </select>
                            <select>
                            <option>2015</option>
                            <option>2016</option>
                            <option>2017</option>
                          <option>2018</option>
                            <option>2019</option>
                            <option>2020</option>
                          <option>2021</option>
                            <option>2022</option>
                            <option>2023</option>
                          <option>2024</option>
                            </select>
                            </td>
                        </tr>
                        <tr>
                            <td>CVV (3 Digit) </td>
                            <td><input type="number" name="cardnum" maxlength="3" required> </td>
                        </tr>
                        
                       </table>   
                <br>
                <hr><br>
                <h2>Your card will be charged a total of : <%=currentOrder.getTotalCost()%></h2>
                
               
               
                       
                       
  </form> <table>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        
                        <td>  <form action="${pageContext.request.contextPath}/myservlet" method="post" >
                      
				<input class="main_but" type="submit" value="Purchase" name="submit"/>
                        </td>
                                       
                    
                </tr>
                </table>
                </form>
               
            
            </div>
        <c:import url="/include/footer.jsp" />
    </body>
    
</html>


