<style>
</style>

<div class="modal fade" id="goldModal" tabindex="-1" role="dialog" aria-labelledby="salesModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content"> 
      <div class="modal-header">
        <h5 class="modal-title" id="salesModalLabel">고금등록</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form name="goldForm">
			<div class="form-group mb-1">
				<label for="goldDt" required>영업일</label>
				<input id="goldDt" readonly name="goldDt" type="text" autocomplete="one-time-code" class="form-control"/>
			</div>
			<div class="row">
				<div class="form-group col">
					<label for="k10">10k</label>
					<input id="k10" name="k10" type="number" autocomplete="one-time-code" class="form-control"/>
				</div>
				<div class="form-group col">
					<label for="k14">14k</label>
					<input id="k14" name="k14" type="number" autocomplete="one-time-code" class="form-control"/>
				</div>
				<div class="form-group col">
					<label for="k18">18k</label>
					<input id="k18" name="k18" type="number" autocomplete="one-time-code" class="form-control"/>
				</div>
				<div class="form-group col">
					<label for="k24">24k</label>
					<input id="k24" name="k24" type="number" autocomplete="one-time-code" class="form-control"/>
				</div>
				<div class="form-group col">
					<label for="diamond">다이아</label>
					<input id="diamond" name="diamond" type="number" autocomplete="one-time-code" class="form-control"/>
				</div>
			</div>
			<div class="row">
				<div class="form-group col">
					<label for="k10">이체환불</label>
					<input id="k10" name="transfer" type="number" autocomplete="one-time-code" class="form-control"/>
				</div>
				<div class="form-group col">
					<label for="k14">현금환불</label>
					<input id="k14" name="cash" type="number" autocomplete="one-time-code" class="form-control"/>
				</div>
				<div class="form-group col">
					<label for="k18">보상판매</label>
					<input id="k18" name="goods" type="number" autocomplete="one-time-code" class="form-control"/>
				</div>
				<div class="form-group col">
					<label for="k24">본인금주문</label>
					<input id="k24" name="gold" type="number" autocomplete="one-time-code" class="form-control"/>
				</div>
			</div>
		</form>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="submitGoldInsert();">Save changes</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('#goldDt').datepicker({ 
			uiLibrary: 'bootstrap5', 
			iconsLibrary: 'materialicons',
			format: 'yyyy-mm-dd',
			value: today
		});
		
		const goldModal = document.getElementById("goldModal");
		goldModal.addEventListener('show.bs.modal', function (event) {
		  $('#goldDt').val(today)
		});
	});

	function submitGoldInsert() {
		$.ajax({
			url: "/api/insertGoldMng", 
			data: JSON.stringify($("[name=goldForm]").serializeObject()),
			contentType: "application/json;charset=UTF-8",
			method: "POST",
			dataType: "json",
			success: function(res) {
				getList();
			}
		})
	}
</script>