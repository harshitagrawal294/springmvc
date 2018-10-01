<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="base.jsp" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/table.css" />"/>
<body>
<br>
<a href="/dbms/dashboard" style="font-size:15px;margin-left:40px">Back</a>
<h2 style="text-align:center">Favorites</h2>

<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover tablesaw tablesaw-stack" data-tablesaw-mode="stack">
        <thead>
          <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Product Price</th>
            <th>Product Description</th>
            <th>Dislike</th>
          </tr>
        </thead>
        
        <tbody>
          <c:forEach items="${favorites}" var="product">
	    <tr>
	    	<td>${product.productid}</td>
	    	<td>${product.productname}</td>
	    	<td>${product.productprice}</td>
	    	<td>${product.description}</td>
	    	<td><a href = "/dbms/dislike/${product.productid}">Dislike</a>
	    	</td>
	     </tr>
	</c:forEach>
        </tbody>
        <tfoot>

        </tfoot>
      </table>
    </div>
  </div>
</div>

</body>