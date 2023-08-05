<style>
	#sales th  {
		position: sticky;
		top: 110px;
		font-size:14px;
	}
	#sales td {
		font-size:14px;
	}
</style>

<ul class="nav nav-dark nav-tabs mb-3">
  <li class="nav-item">
    <a class="nav-link" href="#">영업일지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/gold">고금관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/cash">시재관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/repair">수리관리</a>
  </li>
</ul>

<div class="card mb-4" style="position: sticky; top:50px;">
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
		    	<div class="col-2">
				    <select class="form-select" name="salesType">
				    	<option value="">전체</option>
				    	<#list salesTypes as salesType>
				    		<option value="${salesType.codeVal}">${salesType.codeDesc}</option>
				    	</#list>
				    </select>
		    	</div>
		    	<div class="col-1">
				    <select class="form-select" name="karatage">
				    	<option value="">전체</option>
				    	<#list karatages as karatage>
				    		<option value="${karatage.codeVal}">${karatage.codeDesc}</option>
				    	</#list>
				    </select>
		    	</div>
		    	<div class="col-2">
				    <select class="form-select" name="prdType">
				    	<option value="">전체</option>
				    	<#list prdTypes as prdType>
				    		<option value="${prdType.codeVal}">${prdType.codeDesc}</option>
				    	</#list>
				    </select>
		    	</div>
		    	<div class="col-2">
		    		<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#salesModal">일지 등록</button>
		    	</div>
		  	</div>
			<input type="hidden" name="mode" value="" /> 
			<input type="hidden" name="updSalesSeq" value="" /> 
		</form>
	</div>
</div>

<table id="sales" class="table table-bordered table-responsive-lg">
	<thead>
        <tr class="text-center align-middle">
        	<th >연번</th>
            <th class="col-1" id="salesDt">주문일</th>
            <th style="width:7%">주문유형</th>
            <th class="col-1">제품종류</th>
            <th class="col-1">주문순도</th>
            <!--<th rowspan=2>제품가</th>-->
            <th class="col-1">판매가</th>
            <!--<th rowspan=2>할인율</th>-->
        	<th style="width:7%">카드</th>
        	<th style="width:7%">계좌이체</th>
        	<th style="width:7%">현금</th>
        	<th style="width:7%">고금</th>
        	<th style="width:7%">현물</th>
            <th class="col-1">잔금</th>
            <th class="col-2">비고</th>
        </tr>
        <tr class="text-center">

        </tr>
    </thead>
    <tbody>
    </tbody>
</table>
<#include "./saleForm.ftl">

<script type="text/javascript">
	$(document).ready(function(){
		initPage();
		getList();
		//deleteRow();
		updateRow();
	});
	
	let initParam = {};
		initParam.year = '${salesParam.year}';
		initParam.month = '${salesParam.month}';
		initParam.salesType = '${salesParam.salesType?default('')}';
		initParam.karatage = '${salesParam.karatage?default('')}';
		initParam.prdType = '${salesParam.prdType?default('')}';
		
	function initPage() {
		const selects = ['year','month','salesType','karatage','prdType'];
		for(const sel of selects) {
			$("[name=searchForm] select[name="+sel+"]").val(initParam[sel]);
			$("[name=searchForm] select[name="+sel+"]").on('change',function(e){
				getList();
			});
			makeChangeOrder();
		}
	}
	
	let currentList = [];
	function getList() {
		$.get(
			"/api/salesList"
			,$("[name=searchForm]").serialize()
			,function(res){
				currentList = JSON.parse(res);
				makeDateSelector(currentList);
				
				makeHtml();
			});
	}
	
	function makeDateSelector(r) {
		const arr = r.map(s => s.salesDt.slice(-2));
		const set = new Set(arr);
		const result = [...set];
		
		var html = "<option value=''>전체</option>"
		for(const d of result) {
			html += "<option value='"+d+"'>"+d+"일</option>";
		}
		$("select[name=dt]").html(html);
		$("select[name=dt]").change(function(e){
			makeHtml(e.target.value);
		});
	}
	
	function makeHtml(dt) {
		let html = '';
		var nf = Intl.NumberFormat()
		let list = currentList;
		if(dt) {
			list = list.filter(s => s.salesDt.slice(-2) == dt);
		}
		for(const s of list) {
			var rowspanStr = s.salesDtlList?.length > 0 ? ' rowspan="'+s.salesDtlList?.length+'"' : '';
			html += '<tr class="salesRow">';
			html += '	<td class="text-center salesSeq"'+rowspanStr+'>'+s.salesSeq+'</td>'
			html += '	<td class="text-center"'+rowspanStr+'>'+s.salesDt+'</td>'
			html += '	<td class="text-center">'+s.salesDtlList[0].salesTypeStr+'</td>'
			html += '	<td class="text-center">'+(s.salesDtlList[0].prdTypeStr||'')+'</td>'
			html += '	<td class="text-start">'+(s.salesDtlList[0].karatageStr||'')+(s.salesDtlList[0].weight*1>0?"("+s.salesDtlList[0].weight+"돈)":'')+'</td>'
			if(s.salesDtlList[0].dtlSalePrice > 0) {
			//	html += '	<td>'+nf.format(s.salesDtlList[0].dtlPrdPrice)+'</td>'
				html += '	<td class="text-end">'+nf.format(s.salesDtlList[0].dtlSalePrice)+'</td>'
			//	html += '	<td>'+((s.salesDtlList[0].dtlPrdPrice>0)?(100-s.salesDtlList[0].dtlSalePrice/s.salesDtlList[0].dtlPrdPrice*100).toFixed(2):0)+'</td>'
			} else {
			//	html += '	<td'+rowspanStr+'>'+nf.format(s.prdPrice)+'</td>'
				html += '	<td'+rowspanStr+' class="text-end">'+nf.format(s.salePrice)+'</td>'
			//	html += '	<td'+rowspanStr+'>'+((s.prdPrice>0)?(100-s.salePrice/s.prdPrice*100).toFixed(2):0)+'</td>'
			}
			
			html += '	<td'+rowspanStr+' class="text-end">'+(s.paymentCardDtl||0)+'</td>';
			html += '	<td'+rowspanStr+' class="text-end">'+(s.paymentTransferDtl||0)+'</td>';
			html += '	<td'+rowspanStr+' class="text-end">'+(s.paymentCashDtl||0)+'</td>';
			html += '	<td'+rowspanStr+' class="text-end">'+(s.paymentGoldDtl||0)+'</td>';
			html += '	<td'+rowspanStr+' class="text-end">'+(s.paymentGoodsDtl||0)+'</td>';
			html += '	<td'+rowspanStr+' class="text-end">'+
					(s.remain && s.remain.remainSalesSeq > 0 
						? ((s.remain.remainAmt - s.remain.remainPaymentAmt) + ((s.remain?.remainSalesDt)?'('+ s.remain.remainSalesDt +'납부)':''))
						: s.remain?.remainAmt||0)
			+'</td>';
			html += '	<td'+rowspanStr+' class="text-start">'+(s.description||"")+'</td>'
			html += '</tr>'
			if(s.salesDtlList?.length > 1) {
				for(let i=1; i<s.salesDtlList.length;i++){
					const dtl = s.salesDtlList[i];
					html += '<tr>';
					html += '	<td class="text-center">'+dtl.salesTypeStr||''+'</td>'
					html += '	<td class="text-center">'+dtl.prdTypeStr||''+'</td>'
					html += '	<td class="text-start">'+dtl.karatageStr+(dtl.weight*1>0?"("+dtl.weight+"돈)":'')+'</td>'
					if(s.salesDtlList[0].dtlSalePrice > 0) {
						// html += '	<td>'+nf.format(s.salesDtlList[i].dtlPrdPrice)+'</td>'
						html += '	<td class="text-end">'+nf.format(s.salesDtlList[i].dtlSalePrice)+'</td>'
						//html += '	<td>'+((s.salesDtlList[i].dtlPrdPrice>0)?(100-s.salesDtlList[i].dtlSalePrice/s.salesDtlList[i].dtlPrdPrice*100).toFixed(2):0)+'</td>'
					}
					html += '</tr>'
				}
			}
		}
		$("#sales>tbody").html(html);
	}
	
	function updateRow() {
		$("#sales tbody").on('dblclick','.salesRow', function(e) {
			$name('mode').val('update');
			$name('updSalesSeq').val($('.salesSeq',$(e.target).parent()).text());

			var modalEl = document.getElementById('salesModal');
			var modal = bootstrap.Modal.getOrCreateInstance(modalEl);
			modal.show();
		});
	}
	
	function makeChangeOrder() {
		$("#salesDt").off('click');
		$("#salesDt").click(function(e) {
			var ord = $("[name=ordDirection]").val() != 'desc'? "desc" : "";
			 $("[name=ordDirection]").val(ord);
			 getList();
		});
	}
</script>