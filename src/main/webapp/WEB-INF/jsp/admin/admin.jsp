<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#member").click(function(){
		alert("ȸ�������� �̵�");
	});
}); 
</script>
</head>

<body>

<form action="manageMember.do" method="post">
	<div style="padding-top: 200px; padding-left: 35%">
		<button id="member" class="ui button">ȸ������</button>
		<button class="ui button">��ǰ����</button>
		<button class="ui button">��۰���</button>
	</div>
</form>

</body>
</html>