<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<body>
<table class="table table-success table-striped">
 
  <thead>
    <tr>
      <th scope="col" colspan="2" style="text-align: center;font-size:20px; ">회 원 정 보</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row" width="20%" >아이디: </th>
      <td width="80%">${ordered.userid}</td>
    </tr>
    <tr>
      <th scope="row">이 름: </th>
      <td>${ordered.name}</td>
    </tr>
    <tr>
      <th scope="row">이메일:</th>
      <td>${ordered.ordered_to_email}</td>
    </tr>
    <tr>
      <th scope="row">연락처:</th>
      <td>${ordered.ordered_to_tel}</td>
    </tr>
    <tr>
      <th scope="row">우편주소: </th>
      <td>${ordered.ordered_to_post}</td>
    </tr>
      <tr>
      <th scope="row">주  소: </th>
      <td>${ordered.ordered_to_adr}</td>
    </tr>
    
    
  </tbody>
</table>

</body>
</html>