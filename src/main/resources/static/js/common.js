/**
 * 
 */
const today = getDateStr(new Date());

const yesterday = getDateStr(new Date(new Date().setDate(new Date().getDate()-1)));

const weeksago = getDateStr(new Date(new Date().setDate(new Date().getDate()-7)));

const lastDateOfMonth = function(){
	const dt = new Date();
	dt.setMonth(dt.getMonth()+1);
	dt.setDate(1);
	
	dt.setDate(dt.getDate()-1);
	
	return dt.getDate(); 
}();

function getDateStr(dt) {
	return dt.getFullYear() + "-" + ((dt.getMonth() +1)+'').padStart(2,'0') + "-" +  (dt.getDate()+'').padStart(2,0)
}
	
function $name(name, parentObj) {
	return parentObj? $('[name='+name+']',parentObj) : $('[name='+name+']');
}

$.fn.serializeObject = function () {
  "use strict";
  var result = {};
  var extend = function (i, element) {
    var node = result[element.name];
    if ("undefined" !== typeof node && node !== null) {
      if ($.isArray(node)) {
        node.push(element.value);
      } else {
        result[element.name] = [node, element.value];
      }
    } else {
      result[element.name] = element.value;
    }
  };

  $.each(this.serializeArray(), extend);
  return result;
};


