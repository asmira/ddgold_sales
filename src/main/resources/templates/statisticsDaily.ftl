<style>
	th {font-size:15px;}
	td {font-size:14px;}
</style>

<ul class="nav nav-tabs mb-3">
  <li class="nav-item">
    <a class="nav-link" href="#" id="daily">일별통계</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#" id="monthly">월별통계</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#" id="weekday">요일별통계</a>
  </li>
</ul>

<div class="card mb-4">
	<div class="card-body">
		<form name="searchForm">
			<input type="hidden" name="ordDirection" value="${salesParam.ordDirection!""}"/>
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
		    	<div class="col-3">
		    		<div class="btn-group" id="typeGrp" role="group" aria-label="Basic example">
					  <button type="button" class="btn btn-primary active" data-type="karat">순도별</button>
					  <button type="button" class="btn btn-primary" data-type="payment">납부별</button>
					</div>
		    	</div>
		  	</div>
		</form>
	</div>
</div>

<table id="karatStatistics" class="table table-responsive-lg" data-type="karat" data-duration="daily">
	<thead>
        <tr class="text-center align-middle border-bottom border-secondary" id="withoutAvg">
        	<th style="width:14.3%">일자</th>
        	<th style="width:14.3%">14k</th>
        	<th style="width:14.3%">18k</th>
        	<th style="width:14.3%">은</th>
        	<th style="width:14.3%">순금</th>
        	<th style="width:14.3%">총계(순금제외)</th>
        	<th style="width:14.3%">총계</th>
        </tr>
        <tr class="text-center align-middle" id="withAvg" style="display:none">
        	<th style="width:12.5%">구분</th>
        	<th style="width:12.5%">14k</th>
        	<th style="width:12.5%">18k</th>
        	<th style="width:12.5%">은</th>
        	<th style="width:12.5%">순금</th>
        	<th style="width:12.5%">소계(순금제외)</th>
        	<th style="width:12.5%">소계</th>
        	<th style="width:12.5%">일평균</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>

<table id="paymentStatistics" class="table table-responsive-lg" data-type="payment" data-duration="daily" style="display:none">
	<thead>
        <tr class="text-center align-middle border-bottom border-secondary" id="withoutAvg">
        	<th style="width:14.3%">일자</th>
        	<th style="width:14.3%">카드</th>
        	<th style="width:14.3%">계좌이체</th>
        	<th style="width:14.3%">현금</th>
        	<th style="width:14.3%">고금</th>
        	<th style="width:14.3%">현물</th>
        	<th style="width:14.3%">총계</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>

<script type="text/javascript">
	$(document).ready(function(){
		initPage();
		changeType()
		getList($("#typeGrp button.active").data("type"));
	});
	
	let initParam = {};
		initParam.year = '${salesParam.year}';
		initParam.month = '${salesParam.month}';
		
	function initPage() {
		const selects = ['year','month'];
		for(const sel of selects) {
			$("select[name="+sel+"]").val(initParam[sel]);
			$("[name=searchForm] select[name="+sel+"]").on('change',function(e){
				getList($("#typeGrp button.active").data("type"));
			});
		}
		$(".nav-link").click(function(e) {
			$("#karatStatistics, #paymentStatistics").data("duration",e.target.id);
			getList($("#typeGrp button.active").data("type"));
		});
	}
	
	function changeType() {
		$("#typeGrp button").click(function(e){
			console.log(e.target)
			$("#typeGrp button").removeClass("active")
			$(e.target).addClass("active");
			console.log($("#typeGrp button.active").data("type"))
			getList($("#typeGrp button.active").data("type"));
		});
	}

	function getList(type) {
		const duration =$("#"+type+"Statistics").data("duration");
		$.get("/api/statistics/"+type+"/"+ duration, 
			$("[name=searchForm]").serialize(), 
			function(res) {
				currentList = JSON.parse(res);
				if(type=='karat') html = makeKarat(currentList,duration);
				if(type=='payment') html = makePaymant(currentList,duration);
				$("#"+type+"Statistics tbody").html(html);
				$("[id$=Statistics]").hide();
				$("#"+type+"Statistics").show();
			});
	}
	
	function makePaymant(currentList, duration) {
		var nf = Intl.NumberFormat()
		let prevDt="";
		let html = "";
		const weekdayNm = ['월','화','수','목','금','토','일']
		for(const l of currentList) {
			html+= '<tr>';
			if(duration == 'weekday') {
				html+= '	<td>'+weekdayNm[l.colValue]+'</td>';
			} else {
				html+= '	<td>'+l.colValue+'</td>';
			}
			html+= '	<td class="text-end">'+nf.format(l.paymentCardDtl)+'</td>';
			html+= '	<td class="text-end">'+nf.format(l.paymentTransferDtl)+'</td>';
			html+= '	<td class="text-end">'+nf.format(l.paymentCashDtl)+'</td>';
			html+= '	<td class="text-end">'+nf.format(l.paymentGoldDtl)+'</td>';
			html+= '	<td class="text-end">'+nf.format(l.paymentGoodsDtl)+'</td>';
			html+= '	<td class="text-end">'+nf.format(l.total)+'</td>';
			html+= '</tr>';
		}
		const totPaymentCardDtl = sumField(currentList,'paymentCardDtl');
		const totPaymentTransferDtl = sumField(currentList,'paymentTransferDtl');
		const totPaymentCashDtl = sumField(currentList,'paymentCashDtl');
		const totPaymentGoldDtl = sumField(currentList,'paymentGoldDtl');
		const totPaymentGoodsDtl = sumField(currentList,'paymentGoodsDtl');
		
		html+='<tr>';
		html+='		<th>총계</th>'
		html+='		<td class="text-end">'+nf.format(totPaymentCardDtl)+'</td>'
		html+='		<td class="text-end">'+nf.format(totPaymentTransferDtl)+'</td>'
		html+='		<td class="text-end">'+nf.format(totPaymentCashDtl)+'</td>'
		html+='		<td class="text-end">'+nf.format(totPaymentGoldDtl)+'</td>'
		html+='		<td class="text-end">'+nf.format(totPaymentGoodsDtl)+'</td>'
		html+='		<td class="text-end">'+nf.format(totPaymentCardDtl+totPaymentTransferDtl+totPaymentCashDtl+totPaymentGoldDtl+totPaymentGoodsDtl)+'</td>'
		html+='</tr>';
		const cnt = currentList.length;
		return html;
	}
	
	function makeKarat(currentList,duration) {
		var nf = Intl.NumberFormat()
		let prevDt="";
		let html = "";
		const weekdayNm = ['월','화','수','목','금','토','일']
		for(const l of currentList) {
			html+= '<tr>';
			if(duration == 'weekday') {
				html+= '	<td>'+weekdayNm[l.colValue]+'</td>';
			} else {
				html+= '	<td>'+l.colValue+'</td>';
			}
			html+= '	<td class="text-end">'+nf.format(l.k14)+'</td>';
			html+= '	<td class="text-end">'+nf.format(l.k18)+'</td>';
			html+= '	<td class="text-end">'+nf.format(l.silver)+'</td>';
			html+= '	<td class="text-end">'+nf.format(l.gold)+'</td>';
			html+= '	<td class="text-end">'+nf.format(l.total-l.gold)+'</td>';
			html+= '	<td class="text-end">'+nf.format(l.total)+'</td>';
			if(duration == 'monthly' || duration == 'weekday') {
				html+= '	<td>'+nf.format(l.avg)+'</td>';
				$("#withAvg").show();
				$("#withoutAvg").hide();
			} else {
				$("#withAvg").hide();
				$("#withoutAvg").show();
			}
		}
		html+= '</tr>';
		const tot14k = sumField(currentList,'k14');
		const tot18k = sumField(currentList,'k18');
		const totSilver = sumField(currentList,'silver');
		const totGold = sumField(currentList,'gold');
		const cnt = currentList.length;
		
		html+='<tr>';
		html+='		<th>총계</th>'
		html+='		<td class="text-end">'+nf.format(tot14k)+'</td>'
		html+='		<td class="text-end">'+nf.format(tot18k)+'</td>'
		html+='		<td class="text-end">'+nf.format(totSilver)+'</td>'
		html+='		<td class="text-end">'+nf.format(totGold)+'</td>'
		html+='		<td class="text-end">'+nf.format(tot14k+tot18k+totSilver)+'</td>'
		html+='		<td class="text-end">'+nf.format(tot14k+tot18k+totSilver+totGold)+'</td>'
		if(duration == 'monthly' || duration == 'weekday') {
			html+= '	<td></td>';
			$("#withAvg").show();
			$("#withoutAvg").hide();
		} else {
			$("#withAvg").hide();
			$("#withoutAvg").show();
		}
		html+='</tr>';
		
		if(duration != 'weekday') {
			html+='<tr>';
			html+='		<th>평균</th>'
			html+='		<td class="text-end">'+nf.format(tot14k/cnt)+'</td>'
			html+='		<td class="text-end">'+nf.format(tot18k/cnt)+'</td>'
			html+='		<td class="text-end">'+nf.format(totSilver/cnt)+'</td>'
			html+='		<td class="text-end">'+nf.format(totGold/cnt)+'</td>'
			html+='		<td class="text-end">'+nf.format((tot14k+tot18k+totSilver)/cnt)+'</td>'
			html+='		<td class="text-end">'+nf.format((tot14k+tot18k+totSilver+totGold)/cnt)+'</td>'
			html+='</tr>';
		}
		return html;
	}
	
	function sumField(arr, field) {
		const values = arr.map(a => a[field]);
		return values.reduce((a,b)=>a+b,0)
	}
</script>