<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>

</style>
<div align="left">
	<table>
		<tr>
			<ul>
			<sec:authorize access="!isAuthenticated()">
				<li><a href="/" style="color: white"><spring:message code="header.home" /></a><li>
				<li><a href="/board/list"><spring:message code="menu.board.member" /></a></td></li><br>
				<li><a href="/notice/list"><spring:message code="menu.notice.member" /></a></td></li><br>
				<li><a href="/item/list"><spring:message code="menu.item.member" /></a></li>
				<li><a href="/pds/list"><spring:message code="menu.pds.member" /></a></li>
			</sec:authorize>
			</ul>
			<sec:authorize access="isAuthenticated()">

				<sec:authorize access="hasRole('ADMIN')">
					<li><a href="/codegroup/list"><spring:message code="menu.codegroup.list" /></a></td>
					<li><a href="/codedetail/list"><spring:message code="menu.codedetail.list" /></a></td>
					<li><a href="/user/list"><spring:message code="menu.user.admin" /></a></td>
					<li><a href="/board/list"><spring:message code="menu.board.admin" /></a></td>
					<li><a href="/notice/list"><spring:message code="menu.notice.admin" /></a></td>
					<li><a href="/item/list"><spring:message code="menu.item.admin" /></a></td>
					<li><a href="/pds/list"><spring:message code="menu.pds.admin" /></a></td>
				</sec:authorize>

				<sec:authorize access="hasRole('MEMBER')">
					<li style = "font-size : 20px;"><a href="/" style="color: white"><span class="material-symbols-outlined" style = "padding-left:15px; padding-right:15px;">home</span><spring:message code="header.home" /></a><li><br>
					<li style = "font-size : 20px;"><a href="/pds/list" style="color: white"><span class="material-symbols-outlined" style = "padding-left:15px; padding-right:15px;">grade</span><spring:message code="menu.pds.member" /></a></li><br>
					<li style = "font-size : 20px;"><span class="material-symbols-outlined" style = "padding-left:15px; padding-right:15px;">theaters</span>OTT</li><br>
					<li style = "padding-left : 54px; padding-bottom : 5px"><a href="/item/list" style="color: white"><spring:message code="menu.item.member" /></a></li>
					<li style = "padding-left : 54px; padding-bottom : 5px"><a href="/coin/charge" style="color: white"><spring:message code="menu.coin.charge" /></a></li>
					<li style = "padding-left : 54px; padding-bottom : 5px"><a href="/coin/list" style="color: white"><spring:message code="menu.coin.list" /></a></li>
					<li style = "padding-left : 54px; padding-bottom : 5px"><a href="/useritem/list" style="color: white"><spring:message code="menu.useritem.list" /></a></li>
					<li style = "padding-left : 54px; padding-bottom : 5px"><a href="/coin/listPay" style="color: white"><spring:message code="menu.coin.listPay" /></a></li><br>
					<li style = "font-size : 20px;"><span class="material-symbols-outlined" style = "padding-left:15px; padding-right:15px;">mode_comment</span>커뮤니티</li><br>
					<li style = "padding-left : 54px; padding-bottom : 5px"><a href="/board/list" style="color: white"><spring:message code="menu.board.member" /></a></li>
					<li style = "padding-left : 54px"><a href="/notice/list" style="color: white"><spring:message code="menu.notice.member" /></a></li>
				</sec:authorize>
				
			</sec:authorize>

		</tr>
	</table>
</div>
<hr>
