<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<script>
function display(input){
	
}

$(document).ready(function(){
	// Server에 데이터를 요청한다.
	// AJAX로
/* 	$.ajax({
		url:"dashBoard.do?id=${id}",
		type:"GET",
		success:function(datas){
			
		},
		error:function(){
			
		}
	}); */	
});
</script>
<%String rank_avg = request.getParameter("rank_avg"); String tot_avg = request.getParameter("tot_avg");%>
<%String strike_rank = request.getParameter("strike_rank"); String strike_avg = request.getParameter("strike_avg");%>
<div id="main_center">
<h1>Main Center</h1>
<table class="table"  border=1 style="border-collapse:collapse;">
    <thead>
      <tr class="table-primary">
        <th>My Grade</th>
        <th>Avg Rank</th>
        <th>Avg Score</th>
      </tr>
    </thead>
    <tbody>
    <tr class="table-light" >
        <td rowspan="3"><img src="imges/trophy2.png" width="100%"height="100%"/><br></td>
        <td><%=rank_avg %></td>
        <td><%=tot_avg %></td>
      </tr>
      <tr class="table-primary" height="20%">
       
        <td><b>Strike Rank</b></td>
        <td><b>Strike avg</b></td>
      </tr>
      <tr class="table-light" >
      
        <td><%=rank_avg %></td>
        <td><%=tot_avg %></td>
      </tr>
    </tbody>
    </table>
		

My&ensp;Rank!<br>
AVG&ensp;Rank&ensp;=&ensp;<%=rank_avg %>,&ensp;AVG&ensp;=&ensp;<%=tot_avg %><br>
Strike&ensp;Rank&ensp;=&ensp;<%=strike_rank %>,&ensp;Strike&ensp;=&ensp;<%=strike_avg %><br>
<div id="container" style="min-width: 300px; height: 400px; margin: 0 auto"></div>
WHAT THE FUCK!
</div>

