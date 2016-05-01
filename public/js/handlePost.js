$('#console-input').submit(function(event){
	event.preventDefault();
	$.post("/", $('#console-input').serialize(), function(result) {
  	$("#console-output").html(result);
  	$('#input-command').val('');
	});
})