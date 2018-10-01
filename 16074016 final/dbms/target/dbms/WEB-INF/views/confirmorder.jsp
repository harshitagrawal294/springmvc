<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<jsp:include page="base.jsp" />
<html>
<body>
	<h2>${message}</h2> 
    <div class='pm-button'><a href='https://www.payumoney.com/paybypayumoney/#/FA5F5022EECC8B35DA5FF0F588346F21'><img src='https://www.payumoney.com/media/images/payby_payumoney/new_buttons/21.png' /></a></div> 
    <a href="/dbms/placeorder">Skip Payment</a>
    <a href="/dbms/myproducts">Go Back</a>
</body>
</html>
