<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.net.InetAddress"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#member").click(function(){
		
	});
}); 
</script>
</head>

<body>
	<div style="padding-top: 200px; padding-left: 50px; padding-right: 50px;">
		<table class="ui fixed single line celled table" style="width: 50%;" align="right">
			<tr>
				<td>이름</td>
				<td>
					<div class="ui input">
						<input type="text">
					</div>
				</td>
				<td>아이디</td>
				<td>
					<div class="ui input">
						<input type="text">
					</div>
				</td>
				<td><button id="member" class="ui button">검색</button></td>
			</tr>
		</table>
		<table class="ui fixed single line celled table">
			<thead>
				<tr>
					<th>등급</th>
					<th>이름</th>
					<th>아이디</th>
					<th>이메일</th>
					<th>생년월일</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach items="${list}" var="row">
							<tr>
								<td>${row.PMS}<i class="pointing down icon"></i><i class="pointing up icon"></i></td>
								<td>${row.NAME}</td>
								<td>${row.ID}</td>
								<td>${row.EMAIL}</td>
								<td>${row.BIRTHDAY}</td>
								<td>${row.ADDRESS}</td>
								<td>
								    <button id="member" class="ui button">수정</button>
								    <button id="member" class="ui button">삭제</button>
									<i class="zoom icon"></i>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="10">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="10">
						<div class="ui right floated pagination menu">
							\ <a class="icon item"> <i class="left chevron icon"></i>
							</a> <a class="item">1</a> <a class="item">2</a> <a class="item">3</a>
							<a class="item">4</a> <a class="icon item"> <i
								class="right chevron icon"></i>
							</a>
						</div>
					</th>
				</tr>
			</tfoot>
		</table>
	</div>

	<%
		InetAddress local = InetAddress.getLocalHost();

		String ip = local.getHostAddress();
		System.out.print(ip);
	%>
	<form action="">
		<input type="text" value="<%=ip%>">
		<input type="text" value="<%=local%>">
	</form>

</body>
</html>