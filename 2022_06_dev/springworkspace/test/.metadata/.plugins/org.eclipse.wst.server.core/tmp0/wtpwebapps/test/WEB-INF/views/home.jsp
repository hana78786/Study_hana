<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<button onclick="test();"></button>


<script type="text/javascript">
function test(){
	var xHttp= new XMLHttpRequest();
	xHttp.open("get","ajax/ajax.do?test=hello",true);
	xHttp.onreadystatechange=function(){
		if(this.readyState==2&&this.status==200){
			console.log("성공")
		}else if (this.readyState==2&&this.status==400){
			console.log("실패")
		}
	}
	xHttp.send();
	
}

</script>

</body>
</html>
