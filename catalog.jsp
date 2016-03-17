<%@page import="Beans.Product"%>
<%@page import="Beans.Catalog"%>
<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" type="text/css" href="newcss.css"><meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    
    <body>	
      <c:import url="/include/header.jsp" />
      <c:import url="/include/usernavigation.jsp" />
      <c:import url="/include/sitenavigation.jsp" />
            
            <div class="content">
                <form name="catalogDropDown" class="dropdown">
                 <select name="catalogCategory" onchange="document.catalogDropDown.submit();">
                        <option value="">Select</option>
                        <option value="all">All</option>
                        <%
					ArrayList<String> catalogList = (ArrayList<String>) request.getSession().getAttribute("catalogList");
					ArrayList<String> catalogReqList = (ArrayList<String>) request.getSession().getAttribute("catalogRequested");
					ArrayList<Product> productList = (ArrayList<Product>) request.getSession().getAttribute("productList");
					String field="";
			        for(int i=0;i<catalogList.size();i++) {
			            field=catalogList.get(i);
			        %>
					<option value="<%=field %>"><%=field %></option>
                                        <%}%>
                 </select>
                </form>
        <table>
          
                <tr>
                <th>sample</th>
                <th>product</th>
                <th>category</th>
                <th>Price</th>

            </tr>
           
             
                 
                 <%
			String catalogName="";
			for(int i=0;i<catalogReqList.size();i++) {
	            catalogName=catalogReqList.get(i);
                    for(int j=0;j<productList.size();j++) {
				String catalog = productList.get(j).getCategory();
				if(catalogReqList.get(i).equals(catalog)){
					String productName = productList.get(j).getProductName();
					int productCode = productList.get(j).getProductCode();
                                        String imageUrl=productList.get(j).getImageUrl();
                                        double price=productList.get(j).getPrice();
                                        
	         %>
                <tr>
                    <td><img src="<%=imageUrl%>" alt="<%=productCode%>"/></td>
                    <td><a href="category?productCode=<%=productCode%>"><%=productName %></a></td>
                    <td><%=catalogName%></td>
                    <td>$<%=price%></td>
                </tr>
                <%}}}%>
   
               
                </table>
 
            </div>
        
        <c:import url="/include/footer.jsp" />
    </body>
</html>

