<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty property="bbsTitle" name="bbs"/>
<jsp:setProperty property="bbsContent" name="bbs"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List!!</title>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}

	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('ログインしてください。')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}

	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}

	if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('有効ではない内容です')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}

	else{

		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.delete(bbsID);

		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('削除失敗です！')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");

		}
	}
%>
</body>
</html>