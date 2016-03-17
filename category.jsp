<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Product"%>
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
		ArrayList<Product> productList = (ArrayList<Product>) request.getSession().getAttribute("productList");
		String productCodeReq = request.getParameter("productCode");
		Product product = new Product(); 
		for(int i=0;i<productList.size();i++) {
            if(productList.get(i).getProductCode() == Integer.parseInt(productCodeReq)){
            	product = productList.get(i);
            	break;
            }
		}
        %>
                        <div class="prdDetails"><h3><%=product.getProductName()%></h3>
		<h4>Catalog</h4>
		<h5>Price: $<%=product.getPrice()%></h5>
            </div>
            <div class="prdImage">
            <img class="prdImg" src="<%=product.getImageUrl()%>">
            </div>
                <article>
                    <p><%=product.getDescription()%><p>
		</article>
                <form name="addProduct" method="post">
			<input value="<%=product.getProductCode()%>" type="hidden" name="productToAdd"/>
			<button id="main_but" type="button" value="Add to Cart"
                                onclick="document.addProduct.submit()">Add to Cart</button>
                        <button id="main_but" type="button" value="returnToCatalog"
                        onclick="location.href='catalog'">Return To Catalog</button>
		</form>
		
                      </div>
                                    
                    
        <c:import url="/include/footer.jsp" />
        
    </body>
</html>
