<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="board.header.read" /></h2>

<form:form modelAttribute="board">
	<form:hidden path="boardNo" id="boardNo" />
	<sec:csrfInput />
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="page" value="${pgrq.page}">
	<input type="hidden" name="searchType" value="${pgrq.searchType}">
	<input type="hidden" name="keyword" value="${pgrq.keyword}">
	
	<table>
		<tr>
			<td><spring:message code="board.title"/></td>
			<td><form:input path="title" readonly="true" /></td>
			<td></td>
		</tr>
		<tr>
			<td><spring:message code="board.writer" /></td>
			<td><form:input path="writer" readonly="true" /></td>
			<td></td>
		</tr>
		<tr>
			<td><spring:message code="board.content" /></td>
			<td><form:textarea path="content" readonly="true" /></td>
			<td></td>
		</tr>
	</table>
</form:form>

<div>
	<sec:authentication property="principal" var="pinfo"/>

	<sec:authorize access="hasRole('ADMIN')">
		<button type="submit" id="btnRemove"><spring:message code="action.remove" /></button>
	</sec:authorize>

	<sec:authorize access="hasRole('MEMBER')">
       <c:if test="${pinfo.username eq board.writer}">
       	<button type="submit" id="btnEdit"><spring:message code="action.edit" /></button>
       	<button type="submit" id="btnRemove"><spring:message code="action.remove" /></button>
       </c:if>
	</sec:authorize>

	<button type="submit" id="btnList"><spring:message code="action.list" /></button>
</div>

<div>
	<sec:authentication property="principal.username" var="userId" />
	<sec:csrfInput />
	<h2>댓글 작성하기</h2>
		<table>
			<tr>
				<td>작성자</td>
				<td id="userId">${userId}</td>
			</tr>
			<tr>
				<td>댓글 내용</td>
				<td><textarea id="commContent" rows="3" cols="50" name="commContent"></textarea></td>
			</tr>
		</table>
	
<%--	<button type="submit" id="addComment" onclick="addComment()">댓글쓰기</button> --%>
	<sec:csrfInput />
	<input type="hidden" name="csrfmiddlewaretoken" value="YrBQxfk6cyAlKqAigDhXJkHaMiwaqvnDktDq2lqP4b1vUcKjdo8tXoKrjBlnt5NG">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="button" onClick="addComment()" value="댓글쓰기" />
	<input type="button" id="comment" onClick="comment()" value="댓글보기" />
	
</div>		
	<div id="comments"></div>



<script>

	function addComment() {
		var userId = $("#userId");
		var commContent = $("#commContent");
		var boardNo = $("#boardNo");
		var comm = {userId : userId, boardNo : boardNo, commContent : commContent};
		var xhr = new XMLHttpRequest();
		var csrf_token = $('[name=csrfmiddlewaretoken]').val();
		
		$.ajax({
			url : "/comment/addComment",
			type : "POST",
			dataType : "json",
			data : JSON.stringify(comm),
			beforeSend : function(xhr) {
				xhr.setRequestHeader("X-Ajax-call", true);
				xhr.setRequestHeader("contentType", "application/json");
			},
			success : function(data) { 
				alert("댓글 작성 완료");
				console.log("userId = " + userId);
				console.log("commContent = " + commContent);
				console.log("boardNo = " + boardNo);
				console.log(comm);
				console.log(data);
				console.log(xhr.status);
			},
			error : function(data) {
				alert("에러");
				console.log("userId = " +userId);
				console.log("commContent = " +commContent);
				console.log("boardNo = " + boardNo);
				console.log(comm);
				console.log(data);
				console.log(xhr.status);
			}
		});
		
	}
	

	function comment() {
	
		var boardNo = $("#boardNo").val();
	
		$.ajax({
			url : "/comment/list?boardNo=" + boardNo,
			type : "get",
			success : function(data) {
				var comment = "<table border=1>";
				comment += "<tr bgcolor='2c2c2c'><td>댓글 번호</td><td>작성자</td><td>댓글 내용</td><td>작성 날짜</td><td>수정</td><td>삭제</td></tr>";
				if(data.length < 1) {
					comment += "<tr>";
					comment += "<td>등록된 댓글이 없습니다.</td>";
					comment += "</tr>";
				} else {
					for(var i = 0; i < data.length; i++) {
						comment += "<tr>";
						comment += "<td>" + (i+1) + "</td>";
						comment += "<td>" + data[i].userId + " 님" + "</td>";
						comment += "<td>" + data[i].commContent + "</td>";
						comment += "<td>" + data[i].commDate + "</td>";
						comment += "<td><input type='button' value='수정'/></td>";
						comment += "<td><input type='button' value='삭제'/></td>";
						comment += "</tr>";
					}
				}
				comment += "</table>";
				
				$("#comments").html(comment);
			},
			
			error : function(data) {
	        	alert("에러가 발생했습니다.");
	        	alert(data);
			},
	            
	        complete : function(data) {
            }
       }); 
	}	


	$(document).ready(function() {

		var formObj = $("#board");
		
		$("#btnEdit").on("click", function() {
			var boardNo = $("#boardNo");
			var boardNoVal = boardNo.val();
			
			self.location = "/board/modify${pgrq.toUriString()}" + "&boardNo=" + boardNoVal;
		});

		$("#btnRemove").on("click", function() {
			formObj.attr("action", "/board/remove");
			formObj.submit();
		});

		$("#btnList").on("click", function() {
			self.location = "/board/list${pgrq.toUriString()}";
		});

	});
</script>
