<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<div style = "float:left; font-size:35px;">
	<a href="/" style="color: white; padding-left:25px;">Gott</a>
</div>
<div align="right">
<table>
	<tr>
		<sec:authorize access="!isAuthenticated()">	
			<td width="80"><a href="/user/register"><spring:message code="header.joinMember" /></a></td>
			<td width="80"><a href="/auth/login"><spring:message code="header.login" /></a></td>
		</sec:authorize>
        
		<sec:authorize access="isAuthenticated()">
			<td width="180">
				<form action="/auth/logout" method="post">
					<sec:csrfInput />
					<sec:authentication property="principal.username"/> 님 <button><spring:message code="action.logout" /></button>
				</form>
			</td>
		</sec:authorize>
	</tr>
</table>
</div>
<hr>