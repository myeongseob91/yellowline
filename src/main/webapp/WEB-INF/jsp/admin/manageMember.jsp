<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ����</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
    
<script type="text/javascript">
$(document).ready(function() {
	
	$(".isDel").children().next().each(function(){ //������ ȸ���� ������
		if($(this).val()=='Y'){
			$(this).parent().parent().attr('class','error');
			$(this).parent().next().next().next().next().next().next().children().next().text('����');
		}
	});
	
	$("#memberTb i").click(function(){
		var no = $(this).prev().prev().val(); //�հ��� �̹����� i�±� ��������� input�� ���(mem_no)
		var name = $(this).parent().next().text();
		
		if($(this).attr('class')=='pointing down icon'){
			var msg = name+'���� ȸ������ ���� ��Ű�ڽ��ϱ�?';
			
			if(confirm(msg)!=0){
				var flag='down';
				document.location.href="updateRating.do?flag="+flag+"&no="+no;
			}else{
				return;
			}
			
		}else if($(this).attr('class')=='pointing up icon'){
			var msg = name+'���� �����ڷ� �°� ��Ű�ڽ��ϱ�?';
			
			if(confirm(msg)!=0){
				var flag='up';
				document.location.href="updateRating.do?flag="+flag+"&no="+no;
			}else{
				return;
			}
		}
	});

	$('button[id^="delete"]').click(function(){ //��ư �迭 id�� ��������
		var no = $(this).val();
		var flag = $(this).text();
		
		if(flag=='����'){
			var msg = 'ȸ���� �����Ͻðڽ��ϱ�?';
			flag = 'delete';
			
			if(confirm(msg)!=0){
				document.location.href="deleteMember.do?no="+no+"&flag="+flag;
			}else{
				return;
			}	
		} else if(flag=='����'){
			var msg = 'ȸ���� �����Ͻðڽ��ϱ�?';
			flag = 'restore';
			
			if(confirm(msg)!=0){
				document.location.href="deleteMember.do?no="+no+"&flag="+flag;
			}else{
				return;
			}	
		}
	});
	
	$("#test").click(function(){
		document.location.href="deleteMember.do?no=4";
	});
});

function infoPopup(no){ //jquery �ٱ��� �����ؾ��� <script> ������ ����
	var cw = 800; //â����
	var ch = 700; //â����
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
				<td>�̸�</td>
				<td>
					<div class="ui input">
						<input type="text">
					</div>
				</td>
				<td>���̵�</td>
				<td>
					<div class="ui input">
						<input type="text">
					</div>
				</td>
				<td><i class="search icon"></i></td>
			</tr>
		</table>
		<table class="ui celled table">
			<thead>
				<tr>
					<th>���</th>
					<th>�̸�</th>
					<th>���̵�</th>
					<th>�̸���</th>
					<th>�������</th>
					<th>�ּ�</th>
					<th style="width:14%;"></th>
				</tr>
			</thead>
			<tbody id="memberTb">
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach items="${list}" var="row">
							<tr>
								<td class="isDel">
								${row.PMS}
									<input type="hidden" value="${row.MEM_NO}">
									<input type="hidden" value="${row.IS_DEL}">
										<c:choose>
											<c:when test="${row.PMS == '������'}">
												<i class="pointing down icon" style="cursor: pointer;"></i>
											</c:when>
											<c:when test="${row.PMS == 'ȸ��'}">
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
								    <button id="modify" class="ui button" onclick="infoPopup(${row.MEM_NO})">����</button>
								    <button id="delete" class="ui button" type="button" value="${row.MEM_NO}">����</button>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="10">��ȸ�� ����� �����ϴ�.</td>
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