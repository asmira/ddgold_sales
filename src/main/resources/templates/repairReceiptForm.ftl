<div class="modal fade" id="receiptModal" tabindex="-1" role="dialog" aria-labelledby="receiptModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content"> 
      <div class="modal-header">
        <h5 class="modal-title" id="receiptModalLabel">수리완료처리</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form name="receiptForm">
			<input type="hidden" name="repairDtlSeq" value="" />
			<div class="form-group mb-1">
				<label for="receiptDate" required>수리완료일</label>
				<input id="receiptDate" readonly name="receiptDate" type="text" autocomplete="one-time-code" class="form-control"/>
			</div>
		</form>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="submitReceiptUpdate();">Save changes</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
	$(document).ready(function(){
		$('#receiptDate').datepicker({ 
			uiLibrary: 'bootstrap5', 
			iconsLibrary: 'materialicons',
			format: 'yyyy-mm-dd',
			value: today
		});
	});

	function submitReceiptUpdate() {
		$.ajax({
			url: "/api/updateReceipt", 
			data: JSON.stringify($name("receiptForm").serializeObject()),
			contentType: "application/json;charset=UTF-8",
			method: "POST",
			dataType: "json",
			success: function(res) {
				getList();
			}
		})
	}

</script>