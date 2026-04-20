<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Result Form</title>

<script>
function validateForm() {
    let form = document.forms["studentForm"];

    let roll = form["rollno"].value.trim();
    let name = form["name"].value.trim();

    if (roll === "" || name === "") {
        alert("Roll No and Name are required");
        return false;
    }

    let subjects = ["sub1","sub2","sub3","sub4","sub5"];

    for (let i = 0; i < subjects.length; i++) {
        let val = form[subjects[i]].value;

        if (val === "" || isNaN(val) || val < 0 || val > 100) {
            alert("Enter valid marks (0-100) for all subjects");
            return false;
        }
    }

    return true;
}
</script>

<style>
.container {
    width: 400px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ccc;
}
input {
    margin: 5px 0;
}
</style>

</head>

<body>

<div class="container">
<h2>Student Result Form</h2>

<form name="studentForm" action="processResult" method="POST" onsubmit="return validateForm()">

Roll No: <input type="text" name="rollno"><br>

Name: <input type="text" name="name"><br>

Sub1: <input type="text" name="sub1"><br>
Sub2: <input type="text" name="sub2"><br>
Sub3: <input type="text" name="sub3"><br>
Sub4: <input type="text" name="sub4"><br>
Sub5: <input type="text" name="sub5"><br><br>

<input type="submit" value="Calculate Result">

</form>
</div>

</body>
</html>