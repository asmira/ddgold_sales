<div class="col-2">
	<select class="form-select" name="year">
		<#list 2023..2033 as x>		
    	<option value="#{x}">#{x}년</option>
    	</#list>
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
<script type="text/javascript">
	$(document).ready(function(){
		const dt = new Date();
		$('select[name=year]').val(dt.getFullYear());
		$('select[name=month]').val(((dt.getMonth()+1)+'').padStart(2,'0'));
		
		const selects = ['year','month'];
		for(const sel of selects) {
			$("select[name="+sel+"]").val(initParam[sel]);
			$("[name=searchForm] select[name="+sel+"]").on('change',function(e){
				getList&&getList();
			});
		}
	});
</script>