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
		    	<#include "./layout/dateSelector.ftl">
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
      <th class="col-1">접수일</th>
      <th class="col-1">고객명</th>
      <th style="width:12%">연락처</th>
      <th>수리내용</th>
      <th class="col-1">순도</th>
      <th class="col-1">제품</th>
      <th class="col-1">색상</th>
      <th class="col-1">수리완료일</th>
      <th class="col-1">출고일</th>
    </thead>
    <tbody>
    </tbody>
</table>

<#include "./repairForm.ftl">
<#include "./repairReceiptForm.ftl">
<#include "./repairFinishForm.ftl">

<script type="text/javascript">
  $(document).ready(function(){
    initPage();
    getList();
    deleteRepair();
    
	$("#repairTable").on("dblclick",".receiptTd", function(e) {
		if(confirm('수리완료를 취소하시겠습니까?')) {
			$.ajax({
				url: "/api/cancelReceipt", 
				data: JSON.stringify({repairDtlSeq: $(e.target).data('receiptSeq')}),
				contentType: "application/json;charset=UTF-8",
				method: "POST",
				dataType: "json",
				success: function(res) {
					getList();
				}
			});
		}
	});
	
	$("#repairTable").on("click",".receiptBtn", function(e) {
		console.log($(e.target).data('receiptSeq'));
		$name('repairDtlSeq',$('#receiptModal')).val($(e.target).data('receiptSeq'));
	});

	$("#repairTable").on("click",".finishBtn", function(e) {
		console.log($(e.target).data('receiptSeq'));
		$name('repairDtlSeq',$('#finishModal')).val($(e.target).data('finishSeq'));
		$name('repairSeq',$('#finishModal')).val($(e.target).data('repairSeq'));
	});
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
						
	function initPage() {}

  function getList() {
  	const year = $("select[name=year]").val();
	const month = $("select[name=month]").val();
	
	const paramDt = {};
	if(!!year) {
		paramDt.year = year;
		if(!!month){
			paramDt.month = month;
		} 
	}
	
    $.get("/api/repairList",paramDt, function(res) {
		const currentList = JSON.parse(res);
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
		html+="<tr class='repairRow' data-seq='"+data.repairSeq+"'>";
		html+="	<td"+(data.repairDtlList?" rowspan='"+data.repairDtlList.length+"'":"")+">"+data.repairSeq+"</td>";
		html+="	<td"+(data.repairDtlList?" rowspan='"+data.repairDtlList.length+"'":"")+">"+data.repairDate+"</td>";
		html+="	<td"+(data.repairDtlList?" rowspan='"+data.repairDtlList.length+"'":"")+">"+data.repairName+"</td>";
		html+="	<td"+(data.repairDtlList?" rowspan='"+data.repairDtlList.length+"'":"")+">"+data.repairMobile+"</td>";
		html+="	<td"+(data.repairDtlList?" rowspan='"+data.repairDtlList.length+"'":"")+"><pre>"+data.repairDesc+"</pre></td>";
		$(data.repairDtlList)?.each((idx,dtl) => {
			if(idx > 0) html+="<tr>";
			
			html+="	<td>"+(dtl.karatageStr?dtl.karatageStr:'')+"</td>";
			html+="	<td>"+(dtl.prdTypeStr?dtl.prdTypeStr:'')+"</td>";
			html+="	<td>"+(dtl.colorStr?dtl.colorStr:'')+"</td>";
			if(dtl.receiptDate) {
				html+="	<td class='receiptTd' data-receipt-seq="+dtl.repairDtlSeq+">"+dtl.receiptDate+"</td>";
			} else {
				html+="	<td class='text-center'><button type='button' class='receiptBtn' data-bs-toggle='modal' data-bs-target='#receiptModal' data-receipt-seq='"+dtl.repairDtlSeq+"'>수리완료</button></td>";
			}
			if(dtl.finishStatus === 'R') {
				html+="	<td>재입고("+dtl.finishDate+")</td>";
			} else if(dtl.finishStatus === 'F') {
				html+="	<td>"+dtl.finishDate+"</td>";
			} else {
				html+="	<td class='text-center'><button type='button' class='finishBtn' data-bs-toggle='modal' data-bs-target='#finishModal' data-repair-seq='"+dtl.repairSeq+"' data-finish-seq='"+dtl.repairDtlSeq+"'>출고처리</button></td>";
			}
			if(idx > 0)  html+="</tr>";
		});
		html+="</tr>";
    });
	$("#repairTable tbody").html(html)
  }
</script>