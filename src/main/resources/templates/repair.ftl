<style>
	#sales th  {
		position: sticky;
		top: 85px;
		font-size:15px;
	}
	#sales td {
		font-size:14px;
	}
</style>

<ul class="nav nav-tabs mb-3">
  <li class="nav-item">
    <a class="nav-link" href="/salesList">영업일지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/gold">고금관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/cash">시재관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">수리관리</a>
  </li>
</ul>


<div class="card mb-4">
	<div class="card-body sticky-top" style="top:40px;">
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
		    	<div class="col">
		    		<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#repairModal">수리 등록</button>
		    	</div>
		  	</div>
		</form>
	</div>

  <table class="table table-bordered">
    <thead class="text-center">
      <th>연번</th>
      <th>입고일</th>
      <th>고객명</th>
      <th>연락처</th>
      <th>순도</th>
      <th>제품</th>
      <th>수리내용</th>
      <th>출고일</th>
      <th>반납여부</th>
    </thead>
    <tbody>
    </tbody>
  </table>
<script type="text/javascript">
  $(document).ready(function(){
    initPage();
    getList();
  });

  let initParam = {};
		initParam.year = '${salesParam.year}';
		initParam.month = '${salesParam.month}';

	function makeDt(list) {
		const $sel = $("[name=dt]");
		const dts = list.map(l => l.repairDt);
		const dtSet = new Set(dtlist);
		const dtList = [...dtSet];
		
		
	}
						
	function initPage() {
		const selects = ['year','month'];
		for(const sel of selects) {
			$("select[name="+sel+"]").val(initParam[sel]);
			$("[name=searchForm] select[name="+sel+"]").on('change',function(e){
				getList();
			});
		}
	}

  function getList() {
    $.get("/api/repairList", function(res) {
			currentList = JSON.parse(res);
			
    });
  }

  function drawTable(arr){
    var nf = Intl.NumberFormat()
		let html = "";
    arr.each((data,idx) => {

    });
  }

  
</script>