<style>
	#sales th  {
		position: sticky;
		top: 95px;
		font-size:15px;
	}
	#sales td {
		font-size:14px;
	}
</style>

<ul class="nav nav-tabs mb-3">
  <li class="nav-item">
    <a class="nav-link" href="/salesList">영업일지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/gold">고금관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/cash">시재관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">수리관리</a>
  </li>
</ul>


<div class="card mb-4" style="position: sticky; top:40px;">
	<div class="card-body sticky-top">
		<form name="searchForm">
			<input type="hidden" name="ordDirection" value="${salesParam.ordDirection!''}"/>
			<div class="row">
		    	<div class="col-2">
					<select class="form-select" name="year">
				    	<option value="2023">2023년</option>
				    </select>
		    	</div>
		    	<div class="col-1">
				    <select class="form-select" name="month">
				    	<option value="01">1월</option>
				    	<option value="02">2월</option>
				    	<option value="03">3월</option>
				    	<option value="04">4월</option>
				    	<option value="05">5월</option>
				    	<option value="06">6월</option>
				    	<option value="07">7월</option>
				    	<option value="08">8월</option>
				    	<option value="09">9월</option>
				    	<option value="10">10월</option>
				    	<option value="11">11월</option>
				    	<option value="12">12월</option>
				    </select>
		    	</div>
		    	<div class="col-1">
				    <select class="form-select" name="dt">
				    	<option value="">전체</option>
				    </select>
		    	</div>
		    	<div class="col">
		    		<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#repairModal">수리 등록</button>
		    	</div>
		  	</div>
		</form>
	</div>
</div>

<table class="table table-bordered" id="repairTable">
    <thead class="text-center">
      <th style="width:5%">연번</th>
      <th class="col-1">입고일</th>
      <th class="col-1">고객명</th>
      <th style="width:12%">연락처</th>
      <th>수리내용</th>
      <th class="col-1">순도</th> 
      <th class="col-1">제품</th>
      <th class="col-1">색상</th> 
      <th class="col-1">출고일</th>
      <th class="col-1">반납일</th>
    </thead>
    <tbody>
    </tbody>
</table>
<#include "./repairForm.ftl">
<script type="text/javascript">
  $(document).ready(function(){
    initPage();
    getList();
    deleteRepair();
  });

  let initParam = {};
		initParam.year = '${salesParam.year}';
		initParam.month = '${salesParam.month}';

	function makeDt(list) {
		const $sel = $("[name=dt]");
		const dts = list.map(l => l.repairDt);
		const dtSet = new Set(dtlist);
		const dtList = [...dtSet];
	}
						
	function initPage() {
		const selects = ['year','month'];
		for(const sel of selects) {
			$("select[name="+sel+"]").val(initParam[sel]);
			$("[name=searchForm] select[name="+sel+"]").on('change',function(e){
				getList();
			});
		}
	}

  function getList() {
    $.get("/api/repairList", function(res) {
		const currentList = JSON.parse(res);
		console.log(currentList)
		drawTable(currentList);
    });
  }
  
  function deleteRepair() {
	$("#repairTable").on("dblclick",".repairRow",function(e){
		openConfirm(
			"A/S 대장삭제", 
			"A/S내역을을 삭제 하시겠습니까?",
			function() {
				console.log({goldSeq:$(e.target).parent().data('seq')})
				$.ajax({
					url: "/api/deleteRepair/"+$(e.target).parent().data('seq'), 
					contentType: "application/json;charset=UTF-8",
					method: "POST",
					dataType: "json",
					success: function(res) {
						getList();
						alert('삭제되었습니다.');
					}, fail: function(res) {
						alert('삭제중 오류가 발생하였습니다.');
					}
				})
			}
		);
	});
}

  function drawTable(arr){
    const nf = Intl.NumberFormat()
	let html = "";
    $(arr)?.each((idx,data) => {
		console.log(data,idx);
		html+="<tr class='repairRow' data-seq='"+data.repairSeq+"'>";
		html+="	<td"+(data.repairDtlList?" colspan='"+data.repairDtlList.length+"'":"")+">"+data.repairSeq+"</td>";
		html+="	<td"+(data.repairDtlList?" colspan='"+data.repairDtlList.length+"'":"")+">"+data.repairDate+"</td>";
		html+="	<td"+(data.repairDtlList?" colspan='"+data.repairDtlList.length+"'":"")+">"+data.repairName+"</td>";
		html+="	<td"+(data.repairDtlList?" colspan='"+data.repairDtlList.length+"'":"")+">"+data.repairMobile+"</td>";
		html+="	<td"+(data.repairDtlList?" colspan='"+data.repairDtlList.length+"'":"")+">"+data.repairDesc+"</td>";
		$(data.repairDtlList)?.each((idx,dtl) => {
			html+="	<td>"+(dtl.karatageStr?dtl.karatageStr:'')+"</td>";
			html+="	<td>"+(dtl.prdTypeStr?dtl.prdTypeStr:'')+"</td>";
			html+="	<td>"+(dtl.colorStr?dtl.colorStr:'')+"</td>";
			if(data.receiptDate) {
				html+="	<td>"+dtl.receiptDate+"</td>";
			} else {
				html+="	<td class='text-center'><button type='button'>출고접수</button></td>";
			}
			if(data.receiptDate) {
				html+="	<td>"+data.finishDate+"</td>";
			} else {
				html+="	<td class='text-center'><button type='button'>반납처리</button></td>";
			}
		});
		html+="</tr>";
    });
	$("#repairTable tbody").html(html)

  }

  
</script>