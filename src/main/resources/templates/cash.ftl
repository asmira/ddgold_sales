<style>
	#cash th {
		position: sticky;
		top: 85px;
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
    <a class="nav-link" href="#">시재관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/repair">수리관리</a>
  </li>
</ul>

<div class="card mb-4">
	<div class="card-body sticky-top" style="top:40px;">
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
		    		<button type="button" class="btn btn-secondary" id="closeCashOnHand">마감</button>
		    		<button type="button" class="btn btn-secondary" id="cancelCloseCashOnHand">마감취소</button>
		    		<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#cashModal">시재 등록</button>
		    	</div>
		  	</div>
		</form>
	</div>
</div>

<table id="cash" class="table table-bordered table-sm table-responsive-lg">
	<thead>
        <tr class="text-center align-middle">
        	<th>일자</th>
        	<th>항목</th>
        	<th>입금</th>
        	<th>출금</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>

<#include "./cashForm.ftl">

<script type="text/javascript">
	$(document).ready(function(){
		initPage();
		getList(function() {
			const currentCashOnHandDt = $("#cash tr:last .dt").text();
			if(currentCashOnHandDt < today) {
				alert("전일 시재가 마감되지 않았습니다. 시재마감을 진행해주세요");
			}
		});
		
		
		$("#cash").on("dblclick",".cashRow",function(e){
			openConfirm(
				"시재삭제", 
				"시재를 삭제 하시겠습니까?",
				function() {
					console.log({cashSeq:$(e.target).parent().data('seq')})
					$.ajax({
						url: "/api/deleteCashOnHand", 
						data: JSON.stringify({cashSeq:$(e.target).parent().data('seq')}),
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
				
		$("#closeCashOnHand").click(function(){
			openConfirm(
				"시재마감", 
				$("#cash .dt:last").text() + "일 시재를 마감처리 하시겠습니까?",
				function() {
					$.post("/api/closeCashOnHand", function(res) {
						getList();
					})
				}
			);
		});
		
		$("#cancelCloseCashOnHand").click(function(){
			openConfirm(
				"시재마감", 
				$("#cash .dt:last").text() + "일 시재를 마감취소처리 하시겠습니까? 해당일 등록된 시재가 없어야 합니다.",
				function() {
					$.post("/api/cancleCloseCashOnHand", function(res) {
						console.log(res)
						getList();
					})
				}
			);
		});
	});
	
	let initParam = {};
		initParam.year = '${salesParam.year}';
		initParam.month = '${salesParam.month}';

	function makeDt(list) {
		const $sel = $("[name=dt]");
		const dts = list.map(l => l.cashDt);
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
	
	function getList(callback) {
		$.get("/api/cashList", function(res) {
			currentList = JSON.parse(res);
			var nf = Intl.NumberFormat()
			let prevDt="";
			let html = "";
			
			for(const l of currentList) {
				let prevExpense = 0, prevIncome = 0;
				
				if(!!prevDt && l.cashDt != prevDt) {
					let prevList = currentList.filter(c => c.cashDt == prevDt);
					
					prevList.map(c => prevIncome += c.cashIncome);
					prevList.map(c => prevExpense += c.cashExpense);
					html += "<tr>";
					html += "	<td colspan=2>"+prevDt+" 소계</td>";
					html += "	<td>"+nf.format(prevIncome)+"</td>";
					html += "	<td>"+nf.format(prevExpense)+"</td>";
					html += "</tr>";
					html += "<tr>";
					html += "	<td colspan=2>"+prevDt+" 잔여시제</td>";
					html += "	<td colspan=2>"+nf.format(prevIncome-prevExpense)+"</td>";
					html += "</tr>";
				}
				
				html += "<tr class='cashRow' data-seq='"+l.cashSeq+"'>";
				html += "	<td class='dt'>"+l.cashDt+"</td>";
				html += "	<td>"+l.cashType+"</td>";
				html += "	<td>"+nf.format(l.cashIncome)+"</td>";
				html += "	<td>"+nf.format(l.cashExpense)+"</td>";
				html += "</tr>";

				prevDt = l.cashDt;
			}
			
			$("#cash tbody").html(html);
			(callback) && callback();	
		});
	}
</script>