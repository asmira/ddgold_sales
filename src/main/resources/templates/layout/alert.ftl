<style>
</style>

<div class="modal fade" id="commonAlertModal" tabindex="-1" role="dialog" aria-labelledby="salesModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content"> 
      <div class="modal-header">
        <h5 class="modal-title" id="commonAlertTitle"></h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<span id="commonAlertMessage"></span>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="commonAlertConfirm">확인</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	function openConfirm(title,msg,success) {
		const alertModal = document.querySelector('#commonAlertModal');
		const modal = bootstrap.Modal.getOrCreateInstance(alertModal)
		$("#commonAlertTitle").text(title);
		$("#commonAlertMessage").text(msg);
		const callback = function() {
			success && success();
			modal.hide();
		}
		$("#commonAlertConfirm").off('click')
		$("#commonAlertConfirm").click(callback);
		modal.show();
	}
</script>