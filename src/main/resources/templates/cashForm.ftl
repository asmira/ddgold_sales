<style>
</style>

<div class="modal fade" id="cashModal" tabindex="-1" role="dialog" aria-labelledby="salesModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content"> 
      <div class="modal-header">
        <h5 class="modal-title" id="salesModalLabel">시재등록</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form name="cashForm">
			<div class="form-group mb-1">
				<label for="cashDt" required>영업일</label>
				<input id="cashDt" readonly name="cashDt" type="text" autocomplete="one-time-code" class="form-control"/>
			</div>
			<div class="form-group mb-3">
				<label for="cashType">항목</label>
				<input id="cashType" name="cashType" type="text" autocomplete="one-time-code" class="form-control"/>
			</div>
			<div class="form-group mb-3">
				<label for="cashIncome">입금</label>
				<input id="cashIncome" name="cashIncome" type="text" autocomplete="one-time-code" class="form-control"/>
			</div>
			<div class="form-group mb-3">
				<label for="cashExpense">출금</label>
				<input id="cashExpense" name="cashExpense" type="text" autocomplete="one-time-code" class="form-control"/>
			</div>
		</form>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="submitCashInsert();">Save changes</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('#cashDt').datepicker({ 
			uiLibrary: 'bootstrap5', 
			iconsLibrary: 'materialicons',
			format: 'yyyy-mm-dd',
			value: $("#cash .dt:last").text()
		});
		const cashModal = document.getElementById("cashModal");
		cashModal.addEventListener('show.bs.modal', function (event) {
		  $('#cashDt').val($("#cash .dt:last").text())
		})
		
	});
	
	function submitCashInsert() {
		if($("#cash .dt:last").length > 0 && $("#cashDt").val() != $("#cash .dt:last").text()) {
			alert("마감되지 않은 마지막 날자만 입력가능합니다.");
			return;
		} 
		$.ajax({
			url: "/api/cash/insert", 
			data: JSON.stringify($("[name=cashForm]").serializeObject()),
			contentType: "application/json;charset=UTF-8",
			method: "POST",
			dataType: "json",
			success: function(res) {
				getList();
			}
		})
	}
</script>