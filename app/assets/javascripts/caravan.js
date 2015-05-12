// $(document).ready(function() {
//   $(window).keydown(function(event){
//     if(event.keyCode == 13) {
//     	event.preventDefault();
//     	return false
//     // 	var target = event.target
//     // 	if (target = 'origin_address[address_string]'){
//     // 		$("#button-1").click();
//     // 		console.log("text-field-2");
//     // 	} else if(target = 'destination_address[address_string]'){
//     // 		$("#button-2").click();
//     // 		console.log("clicked num 2");
//     // 	} else if (target = "text-field-3"){
//     // 		$("#button-3").click()
//     // 	}
//     //   // event.preventDefault();
//     //   // return false;
//     // }
//   });
// });

$(document).ready(function() {
  $('#creation-form').on('keydown', 'input', function(event) {
    if(event.keyCode == 13) {
      event.preventDefault();
    }
  });
});