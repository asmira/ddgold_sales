<div class="modal fade" id="finishModal" tabindex="-1" role="dialog" aria-labelledby="finishModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content"> 
      <div class="modal-header">
        <h5 class="modal-title" id="finishModalLabel">출고처리</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form name="finishForm">
			<input type="hidden" name="repairDtlSeq" value="" />
			<input type="hidden" name="repairSeq" value="" />
			<div class="form-floating mb-1">
				<select class="form-select" name="finishStatus" id="finishStatus">
					<option value="F">출고</option>
					<option value="R">재입고</option>
				</select>
				<label for="finishStatus" required>출고구분</label>
			</div>
			<div class="form-group mb-1">
				<label for="finishDate" required><span id="typeTxt">출고</span>일</label>
				<input id="finishDate" readonly name="finishDate" type="text" autocomplete="one-time-code" class="form-control"/>
			</div>
			<div class="returnForm">
				<div class="form-group mb-1">
					<label for="repairDesc">수리내역</label>
					<textarea id="repairDesc" name="repairDesc" type="text" autocomplete="one-time-code" class="form-control"></textarea>
				</div>
			</div>
			<div class="finishForm">
				<div class="form-group mb-1">
					<label for="repairPrice" required>수리비</label>
					<input id="repairPrice" name="repairPrice" type="text" autocomplete="one-time-code" class="form-control"/>
				</div>
				<div class="form-group mb-1">
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
			    			<input type="text" class="form-control" name="paymentGoldDtl" id="goldPriceInput"/>
			    			<label for="goldPriceInput" style="margin-left:8px;">고금</label>
			    		</div>
					</div>
				</div>
			</div>
		</form>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="submitFinishUpdate();">Save changes</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
	$(document).ready(function(){
		$(".returnForm").hide();
		
		$('#finishDate').datepicker({ 
			uiLibrary: 'bootstrap5', 
			iconsLibrary: 'materialicons',
			format: 'yyyy-mm-dd',
			value: today
		});
		
		$("#finishStatus").change((e) => {
			if (e.target.value === 'R') {
			 	$("#typeTxt").html('재입고');
			 	$(".finishForm").hide(); 
			 	$(".returnForm").show();
			} else {
			 	$("#typeTxt").html('출고') 
			 	$(".finishForm").show();
			 	$(".returnForm").hide(); 
			}
		});
	});

	function submitFinishUpdate() {
		let confirmable = true;
		
		if(($name('finishStatus').val() === 'F' && !$name('repairPrice').val())) {
			confirmable = confirm('수리비가 0으로 출고됩니다. 출고하시겠습니까?')
		}
		
		if(
			$name('finishStatus').val() === 'F' && 
			$name('repairPrice').val() > 0 && 
			$name('repairPrice').val()*1 !== ($name('paymentCardDtl').val()*1) + ($name('paymentTransferDtl').val()*1) + ($name('paymentCashDtl').val()*1) + ($name('paymentGoldDtl').val()*1)
		) {
			alert('수리금액과 납부금액이 맞지않습니다.');
			confirmable = false;
		}
		
		if(confirmable) {
			$.ajax({
				url: "/api/updateFinish", 
				data: JSON.stringify($name("finishForm").serializeObject()),
				contentType: "application/json;charset=UTF-8",
				method: "POST",
				dataType: "json",
				success: function(res) {
					getList();
				}
			})
		}
	}

</script>