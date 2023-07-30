<style>
	#cash th {
		position: sticky;
		top: 85px;
		font-size: 15px;
	}
	td{font-size:14px;}
</style>

<ul class="nav nav-tabs mb-3">
  <li class="nav-item">
    <a class="nav-link" href="/salesList">영업일지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">고금관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/cash">시재관리</a>
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
		    	<div class="col-2">
		    		<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#goldModal">고금 등록</button>
		    	</div>
		  	</div>
		</form>
	</div>
</div>

<table id="gold" class="table table-bordered table-sm table-responsive-lg">
	<thead>
        <tr class="text-center align-middle">
        	<th rowspan="2">일자</th>
        	<th colspan="6">종별</th>
        	<th colspan="5">환불</th>
        </tr>
        <tr class="text-center align-middle">
        	<th>10k</th>
        	<th>14k</th>
        	<th>18k</th>
        	<th>24k</th>
        	<th>다이아몬드</th>
        	<th>고금총액</th>
        	<th>이체환불</th>
        	<th>현금환불</th>
        	<th>보상판매</th>
        	<th>본인금주문</th>
        	<th>금액확인</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>

<#include "./goldForm.ftl">

<script type="text/javascript">
	$(document).ready(function(){
		initPage();
		getList();
		deleteGold();
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
	
	function deleteGold() {
		$("#gold").on("dblclick",".goldRow",function(e){
			openConfirm(
				"고금삭제", 
				"고금을 삭제 하시겠습니까?",
				function() {
					console.log({goldSeq:$(e.target).parent().data('seq')})
					$.ajax({
						url: "/api/deleteGoldMng", 
						data: JSON.stringify({goldSeq:$(e.target).parent().data('seq')}),
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
			
	function getList(callback) {
		$.get("/api/goldList", function(res) {
			currentList = JSON.parse(res);
			var nf = Intl.NumberFormat()
			let prevDt="";
			let html = "";
			for(const l of currentList) {
				let prev10k = 0, prev14k = 0, prev18k=0, prev24k=0, prevDiamond=0;
				let prevTransfer = 0, prevCash = 0, prevGoods=0, prevGold=0;
				
				if(!!prevDt && l.goldDt != prevDt) {
					let prevList = currentList.filter(c => c.goldDt == prevDt);
					prevList.map(c => prev10k += c.k10);
					prevList.map(c => prev14k += c.k14);
					prevList.map(c => prev18k += c.k18);
					prevList.map(c => prev24k += c.k24);
					prevList.map(c => prevDiamond += c.diamond);
					prevList.map(c => prevTransfer += c.transfer);
					prevList.map(c => prevCash += c.cash);
					prevList.map(c => prevGoods += c.goods);
					prevList.map(c => prevGold += c.gold);
					html += "<tr>";
					html += "	<td>"+prevDt+" 소계</td>";
					html += "	<td>"+nf.format(prev10k)+"</td>";
					html += "	<td>"+nf.format(prev14k)+"</td>";
					html += "	<td>"+nf.format(prev18k)+"</td>";
					html += "	<td>"+nf.format(prev24k)+"</td>";
					html += "	<td>"+nf.format(prevDiamond)+"</td>";
					html += "	<td>"+nf.format(prev10k+prev14k+prev18k+prev24k+prevDiamond)+"</td>";
					html += "	<td>"+nf.format(prevTransfer)+"</td>";
					html += "	<td>"+nf.format(prevCash)+"</td>";
					html += "	<td>"+nf.format(prevGoods)+"</td>";
					html += "	<td>"+nf.format(prevGold)+"</td>";
					html += "	<td>"+nf.format(prevTransfer+prevCash+prevGoods+prevGold)+"</td>";
					html += "</tr>";
				}
				console.log(l.k10,l.k14,l.k18,l.k24,l.diamond)
				html += "<tr class='goldRow' data-seq='"+l.goldSeq+"'>";
				html += "	<td class='dt'>"+l.goldDt+"</td>";
				html += "	<td>"+nf.format(l.k10)+"</td>";
				html += "	<td>"+nf.format(l.k14)+"</td>";
				html += "	<td>"+nf.format(l.k18)+"</td>";
				html += "	<td>"+nf.format(l.k24)+"</td>";
				html += "	<td>"+nf.format(l.diamond)+"</td>";
				html += "	<td>"+nf.format(l.k10+l.k14+l.k18+l.k24+l.diamond)+"</td>";
				html += "	<td>"+nf.format(l.transfer)+"</td>";
				html += "	<td>"+nf.format(l.cash)+"</td>";
				html += "	<td>"+nf.format(l.goods)+"</td>";
				html += "	<td>"+nf.format(l.gold)+"</td>";
				html += "	<td>"+nf.format(l.transfer+l.cash+l.goods)+"</td>";
				html += "</tr>";
				prevDt = l.goldDt;
			}
			$("#gold tbody").html(html);
			(callback) && callback();	
		});
	}
</script>