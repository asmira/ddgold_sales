<div class="modal fade" id="repairModal" tabindex="-1" role="dialog" aria-labelledby="salesModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content"> 
      <div class="modal-header">
        <h5 class="modal-title" id="salesModalLabel">수리장 등록</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form name="repairForm">
			<div class="form-group mb-1">
				<label for="repairDate" required>접수일</label>
				<input id="repairDate" readonly name="repairDate" type="text" autocomplete="one-time-code" class="form-control"/>
			</div>
			<div class="form-group mb-3">
				<label for="repairName">고객명</label>
				<input id="repairName" name="repairName" type="text" autocomplete="one-time-code" class="form-control"/>
			</div>
			<div class="form-group mb-3">
				<label for="repairMobile">연락처</label>
				<input id="repairMobile" name="repairMobile" type="text" autocomplete="one-time-code" class="form-control"/>
			</div>
			<div class="form-group mb-3">
				<label for="repairDesc">수리내역</label>
				<textarea id="repairDesc" name="repairDesc" type="text" autocomplete="one-time-code" class="form-control"></textarea>
			</div>
			<div class="form-group prdDtl">
				<div>
					<label for="salesTypeSel">제품등록</label>
					<span style="margin-left:5px;"><button type="button" class="btn btn-sm btn-secondary" id="prdAdd">추가</button></span>
					<span style="margin-left:5px;"><button type="button" class="btn btn-sm btn-secondary" id="prdRemove">삭제</button></span>
				</div>
				<div class="form-group row prdRow">
					<div class="col-4 form-floating">
					    <select class="form-select" name="karatage" id="karatageStr1">
					    	<#list karatages as karatage>
					    		<option value="${karatage.codeVal}">${karatage.codeDesc}</option>
					    	</#list>
					    </select>
					    <label for="karatageStr1" style="margin-left:8px;">금순도</label>
			    	</div>
					<div class="form-floating col-4">
						<select class="form-select" name="prdType" id="prdTypeStr1">
							<#list prdTypes as prdType>
								<option value="${prdType.codeVal}">${prdType.codeDesc}</option>
							</#list>
						</select>
						<label for="prdTypeStr1" style="margin-left:8px;">제품</label>
					</div>
					<div class="form-floating col-4">
						<select class="form-select" name="color" id="colorStr1">
							<#list colors as color>
								<option value="${color.codeVal}">${color.codeDesc}</option>
							</#list>
						</select>
						<label for="color1" style="margin-left:8px;">색상</label>
					</div>
				</div>
			</div>
		</form>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="submitRepairInsert();">Save changes</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
	$(document).ready(function(){
		$('#repairDate').datepicker({ 
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
	});

	function makeParam() {
		const $frm = $("form[name=repairForm]");
		const mngParam = {
			repairDate : $("[name=repairDate]",$frm).val(),
			repairName : $("[name=repairName]",$frm).val(),
			repairMobile : $("[name=repairMobile]",$frm).val(),
			repairDesc : $("[name=repairDesc]",$frm).val(),
		}
		
		const dtlParams = [];
		$(".prdRow",$frm).each((idx,row)=>{
			const dtlParam = {
				karatage:$("[name=karatage]",row).val(),
				prdType:$("[name=prdType]",row).val(),
				color:$("[name=color]",row).val(),
			};
			dtlParams.push(dtlParam);
		});
		
		mngParam.repairDtlList = dtlParams;
		
		return mngParam;
	}

	function submitRepairInsert() {
		$.ajax({
			url: "/api/insertRepair", 
			data: JSON.stringify(makeParam()),
			contentType: "application/json;charset=UTF-8",
			method: "POST",
			dataType: "json",
			success: function(res) {
				getList();
			}
		})
	}

</script>