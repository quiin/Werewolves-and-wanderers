$('#console-input').submit(function(event){
	event.preventDefault();
	$.post("/", $('#console-input').serialize(), function(result) {
		var res = JSON.parse(result);		
  	$("#console-output").html(res.desc);
  	$('#input-command').val('');
	});
})