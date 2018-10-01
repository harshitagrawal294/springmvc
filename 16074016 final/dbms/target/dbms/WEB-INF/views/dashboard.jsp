<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<jsp:include page="base.jsp" />
<html>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/parallax.css" />"/>
<head>

	<script>

	/* $('.img-parallax').each(function(){
	  var img = $(this);
	  var imgParent = $(this).parent();
	  function parallaxImg () {
	    var speed = img.data('speed');
	    var imgY = imgParent.offset().top;
	    var winY = $(this).scrollTop();
	    var winH = $(this).height();
	    var parentH = imgParent.innerHeight();


	    // The next pixel to show on screen      
	    var winBottom = winY + winH;

	    // If block is shown on screen
	    if (winBottom > imgY && winY < imgY + parentH) {
	      // Number of pixels shown after block appear
	      var imgBottom = ((winBottom - imgY) * speed);
	      // Max number of pixels until block disappear
	      var imgTop = winH + parentH;
	      // Porcentage between start showing until disappearing
	      var imgPercent = ((imgBottom / imgTop) * 100) + (50 - (speed * 50));
	    }
	    img.css({
	      top: imgPercent + '%',
	      transform: 'translate(-50%, -' + imgPercent + '%)'
	    });
	  }
	  $(document).on({
	    scroll: function () {
	      parallaxImg();
	    }, ready: function () {
	      parallaxImg();
	    }
	  });
	}); */
	</script>
</head>
<body>
<%-- 	<h2>${message}</h2> 
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>
            Welcome : ${user} | 
        </h2>
        <h3>Hello role login works!!</h3>
        <a href="/dbms/categories">All Products</a><br>
        <a href="/dbms/myproducts">My Cart</a><br>
        <a href="/dbms/profile">View Profile</a><br>
        <a href="/dbms/orderhistory">Order History</a><br>
        <a href="/dbms/notifications">Notifications</a><br>
        <a href="<c:url value="/j_spring_security_logout" />"> Logout</a>
    </c:if>
     --%>
<c:if test="${pageContext.request.userPrincipal.name != null}">
<div class="block">
  <img src="https://unsplash.it/1920/1920/?image=1080" data-speed="0.25" class="img-parallax">
  <h2>Sarada General Stores</h2>
</div>
</c:if>
<c:if test="${pageContext.request.userPrincipal.name == null}">
<div class="block">
  <img src="https://images.unsplash.com/photo-1459984229830-6e16536c2e94?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a2e1dbe630aa2e5b3b11ea0835f600df&auto=format&fit=crop&w=1920&q=60" data-speed="0.25" class="img-parallax">
  <h2>Sarada General Stores</h2>
</div>
</c:if>

    
</body>
</html>
