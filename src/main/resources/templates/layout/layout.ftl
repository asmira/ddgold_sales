<!DOCTYPE html>
<html lang="ko" data-bs-theme="${mode!'dark'}">
<head>
    <meta charset="utf-8">
    <title>${title}</title>
    
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
   	<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet"/>
   	
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.14/js/gijgo.min.js" crossorigin="anonymous"></script>
    <script src="/js/common.js"></script>

   	<style>
   	.table > tbody > tr > td {
    	 vertical-align: middle;
	}

	</style>
</head>
<body>
	<div class="main container">
		<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark border-bottom mb-3">
		  <a class="navbar-brand fw-bolder" href="/" style="margin-right:100px; color:#d4af37;">DD Gold</a>
		  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarNav">
		    <ul class="navbar-nav col-md-5">
		      <li class="nav-item active col-3 ">
		        <a class="nav-link text-center fw-bold" href="/salesList">영업일지</a>
		      </li>
		      <li class="nav-item col-3 ">
		        <a class="nav-link text-center fw-bold" href="/statistics">통계</a>
		      </li>
		      <li class="nav-item col-3 ">
		        <a class="nav-link text-center fw-bold" href="#">주문장</a>
		      </li>
		      <li class="nav-item col-3 ">
		        <a class="nav-link text-center fw-bold" href="#">코드관리</a>
		      </li>
		    </ul>
		  </div>
		</nav>
		<h3 class="mb-3">${title}</h3>
		<#include pagePath>
	</div>
	<#include "./alert.ftl">
</body>
</html>