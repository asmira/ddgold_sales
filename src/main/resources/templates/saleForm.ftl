<style>
</style>

<div class="modal modal-lg fade" id="salesModal" tabindex="-1" role="dialog" aria-labelledby="salesModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content"> 
      <div class="modal-header">
        <h5 class="modal-title" id="salesModalLabel">영업일지등록</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form name="salesForm">
			<div class="form-group mb-1">
				<label for="salesDtFrm" required>영업일</label>
				<input id="salesDtFrm" name="salesDt" type="text" autocomplete="one-time-code" class="form-control"/>
			</div>
			<div class="form-group mb-3" style="display:none">
				<label for="prdPrice">제품금액</label>
				<input id="prdPrice" name="prdPrice" type="text" autocomplete="one-time-code" class="form-control"/>
			</div>
			<div class="form-group mb-3">
				<label for="salePrice">판매금액</label>
				<input id="salePrice" name="salePrice" type="text" autocomplete="one-time-code" class="form-control"/>
			</div>
			<div class="form-group mb-3">
				<label for="">납부</label>
				<div class="row">
					<div class="form-floating col gx-0">
		    			<input type="text" class="form-control" name="paymentCardDtl" id="cardPriceInput"/>
		    			<label for="cardPriceInput" style="margin-left:8px;">카드</label> 
		    		</div>
					<div class="form-floating col gx-0">
		    			<input type="text" class="form-control" name="paymentTransferDtl" id="transferPriceInput"/>
		    			<label for="transferPrice" style="margin-left:8px;">계좌이체</label>
		    		</div>
					<div class="form-floating col gx-0">
		    			<input type="text" class="form-control" name="paymentCashDtl" id="cashPriceInput"/>
		    			<label for="cashPriceInput" style="margin-left:8px;">현금</label>
		    		</div>
					<div class="form-floating col gx-0">
		    			<input type="text" class="form-control" name="paymentGoldDtl" id="goldSellPriceInput"/>
		    			<label for="goldSellPriceInput" style="margin-left:8px;">고금</label>
		    		</div>
					<div class="form-floating col gx-0">
		    			<input type="text" class="form-control" name="paymentGoodsDtl" id="goodsSellPriceInput"/>
		    			<label for="goodsSellPriceInput" style="margin-left:8px;">교환</label>
		    		</div>
				</div>
			</div>
			<div class="form-group mb-3">
				<label for="description">비고</label>
				<input id="description" name="description" type="text" autocomplete="one-time-code" class="form-control"/>
			</div>
			<div class="form-group prdDtl mb-3">
				<div>
					<label for="salesTypeSel">제품등록</label>
					<span style="margin-left:5px;"><button type="button" class="btn btn-sm btn-secondary" id="prdAdd">추가</button></span>
					<span style="margin-left:5px;"><button type="button" class="btn btn-sm btn-secondary" id="prdRemove">삭제</button></span>
				</div>
				<div class="row prdRow mb-1">
					<div class="col-2 form-floating">
					    <select class="form-select" name="salesType" id="salesTypeSel1">
					    	<#list salesTypes as salesType>
					    		<option value="${salesType.codeVal}">${salesType.codeDesc}</option>
					    	</#list>
					    </select>
						<label for="salesTypeSel1" style="margin-left:8px;">주문타입</label>
			    	</div>
			    	<div class="col-2 form-floating">
					    <select class="form-select" name="karatage" id="karatageStr1">
					    	<#list karatages as karatage>
					    		<option value="${karatage.codeVal}">${karatage.codeDesc}</option>
					    	</#list>
					    </select>
					    <label for="karatageStr1" style="margin-left:8px;">금순도</label>
			    	</div>
			    	<div class="col-2 form-floating">
					    <select class="form-select" name="prdType" id="prdTypeStr1">
					    	<#list prdTypes as prdType>
					    		<option value="${prdType.codeVal}">${prdType.codeDesc}</option>
					    	</#list>
					    </select>
					    <label for="prdTypeStr1" style="margin-left:8px;">제품종류</label>
			    	</div>
					<div class="col goldPrd" style="display:none;">
						<div class="row gx-0">
							<div class="form-floating col gx-0 buyingPriceDiv">
				    			<input type="text" class="form-control" name="buyingPrice" id="buyingPriceInput"  value="323000"/>
				    			<label for="buyingPriceInput" style="margin-left:8px;">기준가</label>
				    		</div>
				    		<div class="form-floating col gx-0 weightDiv">
				    			<input type="text" class="form-control" name="weight" id="weightInput"/>
				    			<label for="weightInput" style="margin-left:8px;">무게(돈)</label>
				    		</div>
				    		<div class="form-floating col gx-0 dtlLaborCostDiv">
				    			<input type="text" class="form-control" name="dtlLaborCost" id="dtlLaborCostInput"/>
				    			<label for="dtlLaborCostInput" style="margin-left:8px;">공임비</label>
				    		</div>
				    		<div class="form-floating col gx-0 dtlSalePriceDiv">
				    			<input type="text" class="form-control" name="dtlSalePrice" id="dtlSalePriceInput" readonly/>
				    			<label for="dtlSalePriceInput" style="margin-left:8px;">판매가</label>
				    		</div>
			    		</div>
			    	</div>
			    	<div class="col diffPrd" style="display:none;">
			    		<div class="row">
				    		<div class="form-floating col-6 px0 m0">
				    			<input type="text" class="form-control" name="dtlPrdPrice" id="dtlPrdPriceInput"/>
				    			<label for="dtlPrdPriceInput" style="margin-left:8px;">제품가</label>
				    		</div>
				    		<div class="form-floating col-6 px0 m0">
				    			<input type="text" class="form-control" name="dtlSalePrice" id="dtlSalePriceInput"/>
				    			<label for="dtlSalePriceInput" style="margin-left:8px;">판매가</label>
				    		</div>
			    		</div>
			    	</div>
			    	<div class="col remainPayment" style="display:none;">
			    		<div class="row">
				    		<div class="form-floating col-8 px0 m0">
				    			<select class="form-select" data-remain-amt="0" name="remainTargetSeq" id="remainTargetSeqSel1">
							    </select>
								<label for="remainTargetSeqSel1" style="margin-left:8px;">잔금 주문선택</label>
				    		</div>
							<div class="form-floating col px0 m0">
				    			<input type="text" class="form-control" name="diffPrice" id="diffPriceInput"/>
				    			<label for="diffPriceInput" style="margin-left:8px;">차액</label>
				    		</div>
							<div class="form-floating col px0 m0">
				    			<button class="btn btn-sm btn-secondary" type="button" id="cancelPrevPayment">이전 납부 취소</button>
				    		</div>
			    		</div>
			    	</div>
			    </div>
			</div>
		</form>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="saveSales">Save changes</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	function getCS(obj,str) {
		return $(obj).parent().siblings(str);
	}
	
	function calculate(obj) {
		console.log(obj.name);
		const bp = $("[name=buyingPrice]",getCS(obj,".buyingPriceDiv")).val()*1;

		const w =  (obj.name == "weight")? $(obj).val() : $("[name=weight]",getCS(obj,".weightDiv")).val()*1;
		const lp = (obj.name == "dtlLaborCost")? $(obj).val() : $("[name=dtlLaborCost]",getCS(obj,".dtlLaborCostDiv")).val()*1;
		
		$("[name=dtlSalePrice]",$(obj).parent().siblings(".dtlSalePriceDiv")).val(bp*w*1+lp*1);
		
	}	

	function validate() {
		let isValid = true;
		let fieldName = '';
		let validMsg = ''
		let prnt = null;
		const $frm = $name('salesForm');
		
		const paymentCardDtl = $name('paymentCardDtl',$frm).val()||0
		const paymentTransferDtl = $name('paymentTransferDtl',$frm).val()||0
		const paymentCashDtl = $name('paymentCashDtl',$frm).val()||0
		const paymentGoldDtl = $name('paymentGoldDtl',$frm).val()||0
		const paymentGoodsDtl = $name('paymentGoodsDtl',$frm).val()||0
		const paymentTotal =  paymentCardDtl*1+ paymentTransferDtl*1 + paymentCashDtl*1 + paymentGoldDtl*1 + paymentGoodsDtl*1;
		
		//잔금여부 
		const isRemainPayment = $("[name=salesType]:first",$frm).val() == 6;
		
		// 영업일 필수
		if(!$name('salesDt',$frm).val()){
			fieldName = 'salesDt' 
			isValid= false;
		} 
		
		// 잔금처리아닐때 판매금액 필수
		else if(!isRemainPayment && (!$name('salePrice',$frm).val() || $name('salePrice',$frm).val() == 0)){
			fieldName = 'salePrice'
			isValid= false;
		} 
	
		// 납부금액 > 0 
		else if(paymentTotal == 0) {
			fieldName = 'paymentCardDtl'
			isValid= false;
		}
		
		// 잔금처리일때 납부금액은 잔금과 동일해야함 
		/*else if(isRemainPayment && $("[name=remainTargetSeq] option:selected").data("remainAmt") != paymentTotal) {
			fieldName = 'paymentCardDtl'
			console.log($("[name=remainTargetSeq] option:selected").data("remainAmt"))
			validMsg = '잔금과 납부금액이 맞지 않습니다.';
			isValid= false;
		}*/
		else {
			$(".row").each((idx,row) => {
				// 금이면 무게/판매가/기준액 필수
				const karatage = $name('karatage',$(row)).val();
				if(karatage == '3') {
					const buyingPrice = $name('buyingPrice',$(row)).val()||0;
					const weight = $name('weight',$(row)).val()||0;
					const salePrice = $name('dtlSalePrice', $('.goldPrd',row)).val()||0;
					if(salePrice == 0) {
						fieldName = 'weight'
						prnt = $(row);
						isValid= false;
						return false;
					}
				} 
				
				// 다른순도 있을경우 판매가 필수
				if($(".diffPrd:visible", $(row)).length > 0) {
					const salePrice = $name('dtlSalePrice', $('.diffPrd',row)).val()||0;
					if(salePrice == 0)  {
						fieldName = 'dtlSalePrice'
						prnt = $(row);
						isValid= false;
						return false;
					}
				}
			});
		}
		if(fieldName && prnt) {
			var msg = (validMsg)?validMsg:$name(fieldName, prnt).siblings('label').text() + "은/는 필수값입니다.";
			$name(fieldName, prnt).focus();
			alert(msg);
		} else if (fieldName) {
			var msg = (validMsg)?validMsg:$name(fieldName, $frm).siblings('label').text() + "은/는 필수값입니다.";
			$name(fieldName, $frm).focus();
			alert(msg);
		}
		
		return isValid; 
	}
	
	function save() {
		const $frm = $name('salesForm');

		const mngParam = {
			salesDt : $name('salesDt',$frm).val()
			,prdPrice : $name('prdPrice',$frm).val()||0
			,salePrice : $name('salePrice',$frm).val()||0
			,paymentCardDtl : $name('paymentCardDtl',$frm).val()||0
			,paymentTransferDtl : $name('paymentTransferDtl',$frm).val()||0
			,paymentCashDtl : $name('paymentCashDtl',$frm).val()||0
			,paymentGoldDtl : $name('paymentGoldDtl',$frm).val()||0
			,paymentGoodsDtl : $name('paymentGoodsDtl',$frm).val()||0
			,description : $name('description',$frm).val()
			,remainTargetSeq : $name('remainTargetSeq',$frm).val()
		}
		let isRemainPayment = false;

		const dtlParams = [];
		$('.prdRow').each((idx,row) => {
			const karatage = $name('karatage',$(row)).val();
			const salesType = $name('salesType',$(row)).val();
			const dtlParam = { 
				salesType
				,karatage
				,prdType: $name('prdType',$(row)).val()
			}
			if(karatage == 3) {
				dtlParam.dtlPrdPrice = 0;
				dtlParam.weight = $name('weight',$(row)).val()
				dtlParam.laborCost = $name('dtlLaborCost',$(row)).val()
				dtlParam.dtlSalePrice = $name('dtlSalePrice',$(row)).val()

			} else if($(".diffPrd:visible",$(row)).length > 0) {
				dtlParam.dtlPrdPrice = $name('dtlPrdPrice',$('.diffPrd',row)).val()||0;
				dtlParam.dtlSalePrice = $name('dtlSalePrice',$('.diffPrd',row)).val()||0;

			} else if($('.remainPayment:visible',$(row)).length > 0 && salesType == 6) {
				dtlParam.karatage = '';
				dtlParam.prdType = '';
				dtlParam.diffPrice = $name('diffPrice',$(row)).val();
				isRemainPayment = true;
			} else {
				dtlParam.dtlPrdPrice = 0;
				dtlParam.dtlSalePrice = 0;
			}
			dtlParams.push(dtlParam);
		})
		mngParam.salesDtlList = dtlParams;
		let confirmable = true;
		if(isRemainPayment) {
			const totalPayment = mngParam.paymentCardDtl*1 + mngParam.paymentCashDtl*1 + mngParam.paymentGoldDtl*1 + mngParam.paymentGoodsDtl*1 + mngParam.paymentTransferDtl*1
			const diffPrice = dtlParams[0].diffPrice;
			// 선택된 현재 남은 금액과 납부금액 - 차액이 다를경우 확인.
			const remainAmt = $('.remainPayment:visible [name=remainTargetSeq] option:selected').data('remainAmt');
			if(remainAmt != totalPayment - diffPrice) {
				confirmable = confirm('제품 판매액이 변경됩니다.(잔액 : '+remainAmt+', 제품납부액 : '+(totalPayment - diffPrice)+')\n 저장하시겠습니까?')
			}
		}

		if(confirmable) {
			$.ajax({
				url: "/api/insertSales", 
				data: JSON.stringify(mngParam),
				contentType: "application/json;charset=UTF-8",
				method: "POST",
				dataType: "json",
				success: function(res) {
					getList();
					alert('등록되었습니다.');
				}, fail: function(res) {
					alert('등록중 오류가 발생하였습니다.');
				}
			});
		}
	}
	
	$(document).ready(function(){
		//reset form
		var salesModalEl = document.getElementById('salesModal')
		
		salesModalEl.addEventListener('hidden.bs.modal', function (event) {
		  $("[name=salesForm]").get(0).reset();
		  $(".prdRow:gt(0)").remove()
		})
		
		// set default date on open		
		salesModalEl.addEventListener('show.bs.modal', function (event) {
		  $('#salesDtFrm').val(today);
		  $.get("/api/salesRemainList",{},function(res) {
		  	const list = JSON.parse(res);
		  	$("select[name=remainTargetSeq] option").remove();
		  	
		  	let html = "";
		  	for(const r of list) {
		  		html += "<option value='"+r.salesSeq+"' data-remain-amt='"+r.remainAmt+"'>"+r.salesDt + " | "+ r.description + " | "+r.remainAmt+"</option>";
		  	}
		  	
		  	$("select[name=remainTargetSeq]").append(html);
		  	$("select[name=remainTargetSeq]").off('change');
		  })
		})

		$("#cancelPrevPayment").click(function(e) {
			const $row = $(e.target).closest(".row");
			const currentSeq = $("[name=remainTargetSeq]",$row).val()
			
			$.get("/api/sales/"+currentSeq,{},function(res) {
				const sales = JSON.parse(res);
				console.log(sales);
				const payments = [
					'paymentCardDtl',
					'paymentCashDtl',
					'paymentGoldDtl',
					'paymentGoodsDtl',
					'paymentTransferDtl',	
				];
				for(var p of payments) {
					if(sales[p] != 0) {
						$name(p).val(sales[p]*-1);
					} else {
						$name(p).val('');
					}
				}
			})
		});

		$("#saveSales").click(function() {
			if(validate()) save();
		});
		
	
		$('#salesDtFrm').datepicker({ 
			uiLibrary: 'bootstrap5', 
			iconsLibrary: 'materialicons',
			format: 'yyyy-mm-dd',
			value: today
		});
		
		const rowHtml = $(".prdRow:first").clone().wrapAll("<div/>").parent().html();
		$("#prdAdd").click(function(e){
			$(".prdDtl").append(rowHtml);
		});
		
		$("#prdRemove").click(function(e){
			if($(".prdRow").length > 1) $(".prdRow:last").remove();
		});
		
		$(".prdDtl").on("change","[name=salesType]",function(e) {
			const $trg = $(e.target);
			if($trg.val() == 6) {
				$(".prdRow:gt(0)").remove();
				$(".prdRow:first [name=karatage]").parent().hide();
				$(".prdRow:first [name=prdType]").parent().hide();
				$(".remainPayment").show()
				$(".prdRow:first .diffPrd,.prdRow:first .goldPrd").hide()
			} else {
				$(".prdRow:first [name=karatage]").parent().show();
				$(".prdRow:first [name=prdType]").parent().show();
				$(".remainPayment").hide()
			}
		});
		
		$(".prdDtl").on("change","[name=karatage]", function(e){
			const $trg = $(e.target);
			//금일때			
			if($trg.val() == 3) {
				$trg.parent().siblings(".goldPrd").show()
				$trg.parent().siblings(".diffPrd").hide()
				$trg.parent().siblings(".remainPayment").hide()
				$("[name=weight], [name=dtlLaborCost]").off('keyup');
				$("[name=weight], [name=dtlLaborCost]").off('blur');
				$("[name=weight], [name=dtlLaborCost]").keyup(function(e){calculate(e.target);});
				$("[name=weight], [name=dtlLaborCost]").blur(function(e){calculate(e.target);});
			} else {
				$trg.parent().siblings(".goldPrd").hide()
			}
			
			
			//순도가 다른제품이 존재할때
			let karatChecker = true;
			let lastKaratage = "";
			$("[name=karatage]").each((a,b) => {
				const curKaratage = $(b).val();
				if(!!lastKaratage) 
					karatChecker &= lastKaratage == curKaratage;
				lastKaratage = curKaratage;
			});
			
			if(!karatChecker) {
				$("[name=karatage]").each((a,b) => {
					const $each = $(b);
					if($each.val() != 3) {
						$each.parent().siblings(".diffPrd").show()
						$each.parent().siblings(".goldPrd").hide()
						$each.parent().siblings(".remainPayment").hide()
					} 
				});
			} else {
				$("[name=karatage]").each((a,b) => {
					const $each = $(b);
					if($each.val() != 3) {
						$each.parent().siblings(".diffPrd").hide()
					} 
				});
			}
			
		});
	});
	
</script>