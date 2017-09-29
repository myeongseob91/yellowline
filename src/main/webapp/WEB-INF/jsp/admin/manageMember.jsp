<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 관리</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
    
<script type="text/javascript">
$(document).ready(function() {
	
	$("#memberTb i").click(function(){
		var no = $(this).prev().val(); //손가락 이미지인 i태그 이전노드인 input의 밸류(mem_no)
		var name = $(this).parent().next().text();
		
		if($(this).attr('class')=='pointing down icon'){
			var msg = name+'님을 회원으로 강등 시키겠습니까?';
			
			if(confirm(msg)!=0){
				var flag='down';
				document.location.href="updateRating.do?flag="+flag+"&no="+no;
				
			}else{
				return;
			}
			
		}else if($(this).attr('class')=='pointing up icon'){
			var msg = name+'님을 관리자로 승격 시키겠습니까?';
			
			if(confirm(msg)!=0){
				var flag='up';
				document.location.href="updateRating.do?flag="+flag+"&no="+no;
				
			}else{
				return;
			}
		}
	});
	
	$("#delete").click(function(){
		var msg = '회원을 삭제하시겠습니까?';
		
		if(confirm(msg)!=0){
			//document.location.href="deleteMember.do?no="+no;
			alert('dd');
		}else{
			return;
		}
	});
});

function infoPopup(no){ //jquery 바깥에 선언해야함 <script> 안으로 빼기
	var cw = 800; //창넓이
	var ch = 700; //창높이
	var sw = screen.availWidth;
	var sh = screen.availHeight;
	var px=(sw-cw)/2;
	var py=(sh-ch)/2;
	
	window.open('memberInfo.do?no='+no, '', 'left='+px+',top='+py+',width='+cw+',height='+ch+', location=no, status=no, resizable=no, fullscreen=no, channelmode=no');
}
</script>
</head>

<body>

	<form action="">
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
				<td><i class="search icon"></i></td>
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
					<th style="width:14%;"></th>
				</tr>
			</thead>
			<tbody id="memberTb">
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach items="${list}" var="row">
							<tr>
								<td>${row.PMS}
									<input type="hidden" value="${row.MEM_NO}">
										<c:choose>
											<c:when test="${row.PMS == '관리자'}">
												<i class="pointing down icon" style="cursor: pointer;"></i>
											</c:when>
											<c:when test="${row.PMS == '회원'}">
												<i class="pointing up icon" style="cursor: pointer;"></i>
											</c:when>
										</c:choose>
								</td>
								<td>${row.NAME}</td>
								<td>${row.ID}</td>
								<td>${row.EMAIL}</td>
								<td>${row.BIRTHDAY}</td>
								<td>${row.ADDRESS}</td>
								<td>
								    <button id="modify" class="ui button" onclick="infoPopup(${row.MEM_NO})">수정</button>
								    <button id="delete" class="ui button">삭제</button>
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
	</form>

</body>
</html>