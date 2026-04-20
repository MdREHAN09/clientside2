<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Result Page</title>

<style>
.container {
    width: 400px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ccc;
}
.pass {
    color: green;
}
.fail {
    color: red;
}
</style>

</head>

<body>

<div class="container">

<h2>Student Result</h2>

<p><b><%= request.getAttribute("message") %></b></p>

<%
if(request.getAttribute("roll") != null) {
    int[] marks = (int[]) request.getAttribute("marks");
%>

<p>Roll No: <%= request.getAttribute("roll") %></p>
<p>Name: <%= request.getAttribute("name") %></p>

<h3>Marks:</h3>
<p>Sub1: <%= marks[0] %></p>
<p>Sub2: <%= marks[1] %></p>
<p>Sub3: <%= marks[2] %></p>
<p>Sub4: <%= marks[3] %></p>
<p>Sub5: <%= marks[4] %></p>

<p>Total: <%= request.getAttribute("total") %></p>
<p>Average: <%= request.getAttribute("average") %></p>

<%
String res = (String) request.getAttribute("result");
%>

<p class="<%= res.equals("PASS") ? "pass" : "fail" %>">
Result: <%= res %>
</p>

<% } %>

<br>
<a href="index.jsp">Back to Form</a>

</div>

</body>
</html>