<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>欢迎页</title>	
</head>
<body>
<c:if test="${sessionScope['com.wb.session.loginname']!=null}">
	<jsp:forward page="f10/common/welcome.jsp"></jsp:forward>
</c:if>
<jsp:forward page="login_shyl.jsp" />
</body>
</html>
