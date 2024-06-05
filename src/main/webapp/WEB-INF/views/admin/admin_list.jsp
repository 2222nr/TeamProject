<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./nav.jsp"></jsp:include>
	<h2>Admin List!!!</h2> <br>
	<table border="1">
		<tr>
			<th>계정</th>
			<th>이름</th>
			<th>연락처</th>
			<th>승인</th>
		</tr>
		<c:forEach var="dto" items="${adminDtos}">
			<tr>
				<td>${dto.a_id}</td>
				<td>${dto.a_name}</td>
				<td>${dto.a_phone}</td>
				<td>
					<c:choose>
						<c:when test="${dto.a_approval eq 0}">
							<c:url value='/admin/setAdminApproval' var='approval_url'>
								<c:param name="id" value="${dto.a_id}"></c:param>
							</c:url>
<!-- 							http://localhost:8080/wecky/admin/setAdminApproval?id=wecky -->
								<a href="${approval_url}">승인처리</a>
						</c:when>
						
						<c:when test="${dto.a_approval eq 1}">
							<c:out value="승인완료"></c:out>
						</c:when>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>