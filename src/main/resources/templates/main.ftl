<style>
	th { font-size:15px;}
	td {
		font-size:14px;
	}
</style>
<link href="/js/c3/c3.min.css" rel="stylesheet">
<script src="/js/c3/d3.v5.min.js"></script>
<script src="/js/c3/c3.min.js"></script>

<ul class="nav nav-tabs mb-3" id="grp">
  <li class="nav-item">
    <a class="nav-link" href="#" data-grp="salesGrp">매출관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#" data-grp="miscGrp">현황관리</a>
  </li>
</ul>

<div id="salesGrp">
	<div class="row mb-5">
   		<div class="btn-group mb-4" id="typeGrp" role="group" aria-label="Basic example">
		  <button type="button" class="btn btn-secondary active" data-type="Karat">순도별</button>
		  <button type="button" class="btn btn-secondary" data-type="Payment">납부별</button>
		</div>

		<div class="col-sm-12 col-lg-6">
			<h4>전일 매출</h4>
			<table class="table table-fixed" id="prevKaratStatistics">
				<thead>
					<tr class="text-center border-bottom border-secondary">
						<th scope="col">일자</th>
						<th scope="col">14k</th>
						<th scope="col">18k</th>
						<th scope="col">순금</th>
						<th scope="col">기타</th>
						<th scope="col">총계</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div id="chartYesterday"></div>
			
			<table class="table " id="prevPaymentStatistics">
				<thead>
					<tr class="text-center border-bottom border-secondary">
						<th class="col">일자</th>
						<th class="col">카드</th>
						<th class="col">계좌이체</th>
						<th class="col">현금</th>
						<th class="col">고금</th>
						<th class="col">현물</th>
						<th class="col">합계</th>					
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="col-sm-12 col-lg-6">
			<h4>금일 매출</h4>	
			<table class="table " id="todayKaratStatistics">
				<thead>
					<tr class="text-center border-bottom border-secondary">
						<th class="col">일자</th>
						<th class="col">14k</th>
						<th class="col">18k</th>
						<th class="col">순금</th>
						<th class="col">기타</th>
						<th class="col">총계</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div id="chartToday"></div>
			<table class="table  " id="todayPaymentStatistics">
				<thead>
					<tr class="text-center border-bottom border-secondary">
						<th class="col">일자</th>
						<th class="col">카드</th>
						<th class="col">계좌이체</th>
						<th class="col">현금</th>
						<th class="col">고금</th>
						<th class="col">현물</th>
						<th class="col">합계</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>	
	<div class="row mb-4">
		<div class="col">
			<h4>주간 매출 현황</h4>
			<table class="table" id="weeklyKaratStatistics">
				<thead>
					<tr class="text-center border-bottom border-secondary">
						<th>일자</th>
						<th>14k</th>
						<th>18k</th>
						<th>순금</th>
						<th>기타</th>
						<th>합계</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div id="chartWeek"></div>
			<table class="table" id="weeklyPaymentStatistics">
				<thead>
					<tr class="text-center border-bottom border-secondary">
						<th>일자</th>
						<th>카드</th>
						<th>계좌이체</th>
						<th>현금</th>
						<th>고금</th>
						<th>현물</th>
						<th>합계</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
</div>
	
<div id="miscGrp" style="display:none">
	<div class="row mb-5">
		<div class="col">
			<h4>전일 시재</h4>
			<table id="cashYesterday" class="table table-responsive-lg">
				<thead>
			        <tr class="text-center align-middle border-bottom border-secondary">
			        	<th class="col">일자</th>
			        	<th class="col">항목</th>
			        	<th class="col">입금</th>
			        	<th class="col">출금</th>
			        </tr>
			    </thead>
			    <tbody>
			    </tbody>
			</table>
		</div>
		<div class="col">
			<h4>금일 시재</h4>
			<table id="cashToday" class="table table-responsive-lg">
				<thead>
			        <tr class="text-center align-middle border-bottom border-secondary">
			        	<th class="col">일자</th>
			        	<th class="col">항목</th>
			        	<th class="col">입금</th>
			        	<th class="col">출금</th>
			        </tr>
			    </thead>
			    <tbody>
			    </tbody>
			</table>
		</div>
	</div>
	
	<div class="row mb-5">
		<h4>금일 고금</h4>
		<table id="gold" class="table table-responsive-lg">
			<thead>
		        <tr class="text-center align-middle">
		        	<th rowspan="2" class="border-bottom border-secondary">일자</th>
		        	<th colspan="6" class="border-end">종별</th>
		        	<th colspan="5">환불</th>
		        </tr>
		        <tr class="text-center align-middle border-bottom border-secondary">
		        	<th>10k</th>
		        	<th>14k</th>
		        	<th>18k</th>
		        	<th>24k</th>
		        	<th>다이아</th>
		        	<th class="border-end">고금총액</th>
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
	</div>
</div>

<script type="text/javascript">
	function getStatistics(type,dt, endDt, callback) {
		const param={};
		if(endDt) {
			param.startDate = dt;
			param.endDate = endDt;
		} else {
			param.dt = dt;
		} 
		$.get("/api/statistics/"+type+"/daily", param, function(res){
			if(callback) callback(res);
		});
	}
	
	function getCashOnHand(dt,callback) {
		const param={dt};
		$.get("/api/cash/list", param, function(res){
			if(callback) callback(res);
		});
	}

	function getGoldList(dt,callback) {
		const param={dt};
		$.get("/api/gold/list", param, function(res){
			if(callback) callback(res);
		});
	}
	
	function drawCash(currentList,tbl) {
		var nf = Intl.NumberFormat()
		let html = "";
		let cashDt = '', totIncome=0, totExpense=0;
		for(const l of currentList) {
			html += "<tr data-seq='"+l.cashSeq+"'>";
			html += "	<td class='dt col-3 text-center'>"+l.cashDt+"</td>";
			html += "	<td class='col-3'>"+l.cashType+"</td>";
			html += "	<td class='col-3 text-end'>"+nf.format(l.cashIncome)+"</td>";
			html += "	<td class='col-3 text-end'>"+nf.format(l.cashExpense)+"</td>";
			html += "</tr>";
			cashDt = l.cashDt;
			totIncome += l.cashIncome;
			totExpense += l.cashExpense;
		}
		
		
		html += "<tr>";
		html += "	<td colspan=2 class='text-center'>"+cashDt+" 소계</td>";
		html += "	<td class='text-end'>"+nf.format(totIncome)+"</td>";
		html += "	<td class='text-end'>"+nf.format(totExpense)+"</td>";
		html += "</tr>";
		html += "<tr>";
		html += "	<td colspan=2 class='text-center'>"+cashDt+" 잔여시제</td>";
		html += "	<td colspan=2 class='text-end'>"+nf.format(totIncome-totExpense)+"</td>";
		html += "</tr>";
		
		$("#"+tbl + " tbody").html(html);
	}
	
	function drawGold(currentList,tbl) {
		console.log(currentList,tbl);
		var nf = Intl.NumberFormat();
		let tot10k=0,tot14k=0,tot18k=0,tot24k=0,totTransfer=0,totCash=0,totGold=0,totGoods=0,totDiamond=0;
		
		let html = "";
		for(const l of currentList) {
			html += "<tr class='goldRow' data-seq='"+l.goldSeq+"'>";
			html += "	<td class='dt text-center'>"+l.goldDt+"</td>";
			html += "	<td class='text-end'>"+nf.format(l.k10)+"</td>";
			html += "	<td class='text-end'>"+nf.format(l.k14)+"</td>";
			html += "	<td class='text-end'>"+nf.format(l.k18)+"</td>";
			html += "	<td class='text-end'>"+nf.format(l.k24)+"</td>";
			html += "	<td class='text-end'>"+nf.format(l.diamond)+"</td>";
			html += "	<td class='text-end'>"+nf.format(l.k10+l.k14+l.k18+l.k24+l.diamond)+"</td>";
			html += "	<td class='text-end'>"+nf.format(l.transfer)+"</td>";
			html += "	<td class='text-end'>"+nf.format(l.cash)+"</td>";
			html += "	<td class='text-end'>"+nf.format(l.goods)+"</td>";
			html += "	<td class='text-end'>"+nf.format(l.gold)+"</td>";
			html += "	<td class='text-end'>"+nf.format(l.transfer+l.cash+l.goods)+"</td>";
			html += "</tr>";
			goldDt = l.goldDt;
			tot10k += l.k10;
			tot14k += l.k14;
			tot18k += l.k18;
			tot24k += l.k24;
			totDiamond += l.diamond;
			totTransfer += l.transfer;
			totCash += l.cash;
			totGold += l.gold;
			totGoods += l.goods;
		}
		html += "<tr>";
		html += "	<td class='text-center'>"+goldDt+" 소계</td>";
		html += "	<td class='text-end'>"+nf.format(tot10k)+"</td>";
		html += "	<td class='text-end'>"+nf.format(tot14k)+"</td>";
		html += "	<td class='text-end'>"+nf.format(tot18k)+"</td>";
		html += "	<td class='text-end'>"+nf.format(tot24k)+"</td>";
		html += "	<td class='text-end'>"+nf.format(totDiamond)+"</td>";
		html += "	<td class='text-end'>"+nf.format(tot10k+tot14k+tot18k+tot24k+totDiamond)+"</td>";
		html += "	<td class='text-end'>"+nf.format(totTransfer)+"</td>";
		html += "	<td class='text-end'>"+nf.format(totCash)+"</td>";
		html += "	<td class='text-end'>"+nf.format(totGoods)+"</td>";
		html += "	<td class='text-end'>"+nf.format(totGold)+"</td>";
		html += "	<td class='text-end'>"+nf.format(totTransfer+totCash+totGoods)+"</td>";
		html += "</tr>";
		
		$("#"+tbl + " tbody").html(html);
	}
	
	function drawStatistics(currentList,tbl) {
		var nf = Intl.NumberFormat()
		let prevDt="";
		let html = "";
		for(const l of currentList) { 
			html+= '<tr>';
			html+= '	<td class="col-2 text-center">'+l.colValue+'</td>';
			html+= '	<td class="col-2 text-end">'+nf.format(l.k14)+'</td>';
			html+= '	<td class="col-2 text-end">'+nf.format(l.k18)+'</td>';
			html+= '	<td class="col-2 text-end">'+nf.format(l.gold)+'</td>';
			html+= '	<td class="col-2 text-end">'+nf.format(l.silver)+'</td>';
			html+= '	<td class="col-2 text-end">'+nf.format(l.total)+'</td>';
			html+= '</tr>';
		}
		$("#"+tbl + " tbody").html(html);
	}
	
	function drawPaymentStatistics(currentList,tbl) {
		var nf = Intl.NumberFormat()
		let prevDt="";
		let html = "";
		for(const l of currentList) {  
			console.log(l)
			html+= '<tr>';
			html+= '	<td class="col text-center">'+l.colValue+'</td>';
			html+= '	<td class="col text-end">'+nf.format(l.paymentCardDtl)+'</td>';
			html+= '	<td class="col text-end">'+nf.format(l.paymentTransferDtl)+'</td>';
			html+= '	<td class="col text-end">'+nf.format(l.paymentCashDtl)+'</td>';
			html+= '	<td class="col text-end">'+nf.format(l.paymentGoldDtl)+'</td>';
			html+= '	<td class="col text-end">'+nf.format(l.paymentGoodsDtl)+'</td>';
			html+= '	<td class="col text-end">'+nf.format(l.total)+'</td>';
			html+= '</tr>';
		}
		$("#"+tbl + " tbody").html(html);            
	}
	
	function changeType() {
		$("#typeGrp button").click(function(e){
			console.log(e.target)
			$("#typeGrp button").removeClass("active")
			$(e.target).addClass("active");
			console.log($("#typeGrp button.active").data("type"))
			$("[id$=Statistics]").hide()
			$("[id$="+$("#typeGrp button.active").data("type")+"Statistics]").show()
		});
	}
	
	$(document).ready(function(){
		$("[id$=PaymentStatistics]").hide();
		changeType();
		
		$("#grp a").click(function(e) {
			const visible = $(e.target).data('grp');
			console.log(visible)
			$("#salesGrp,#miscGrp").hide();
			$("#"+visible).show();
		});
		
		getCashOnHand(yesterday,function(res){
			const currentList = JSON.parse(res);
			if(currentList.length == 0) {
				alert("전일 시재가 마감되지 않았습니다. 시재마감을 진행해주세요");
				location.href = "/cash"
			} else {
				drawCash(currentList, 'cashYesterday');
			}
		});

		getCashOnHand(today,function(res){
			const currentList = JSON.parse(res);
			drawCash(currentList, 'cashToday');
		});

		getGoldList(today,function(res){
			const currentList = JSON.parse(res);
			drawGold(currentList, 'gold');
		});
		
		getStatistics('karat',today,null,function(res) {
			const todayObj = JSON.parse(res);
			drawStatistics(todayObj,"todayKaratStatistics")
		});
		
		getStatistics('karat',yesterday,null,function(res) {
			const prevObj = JSON.parse(res);
			drawStatistics(prevObj,"prevKaratStatistics")
		});
		
		getStatistics('karat',weeksago,yesterday,function(res) {
			const obj = JSON.parse(res);
			drawStatistics(obj,"weeklyKaratStatistics")
		});
		getStatistics('payment',today,null,function(res) {
			const todayObj = JSON.parse(res);
			drawPaymentStatistics(todayObj,"todayPaymentStatistics")
		});
		getStatistics('payment',yesterday,null,function(res) {
			const todayObj = JSON.parse(res);
			drawPaymentStatistics(todayObj,"prevPaymentStatistics")
		});
		getStatistics('payment',weeksago,yesterday,function(res) {
			const todayObj = JSON.parse(res);
			drawPaymentStatistics(todayObj,"weeklyPaymentStatistics")
		});
	});
</script>