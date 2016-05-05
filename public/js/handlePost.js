$('#console-input').submit(function(event){
	event.preventDefault();
	$.post("/", $('#console-input').serialize(), function(result) {
		var res = JSON.parse(result);		
		var desc = res.desc
		var player = res.player
		var status = res.is_dead
  	$("#console-output").html(res.desc);
  	$('#input-command').val('');
  	// $('#health').append('send help');
  	if(status){
  		window.location.replace("/dead");
  	}
	});
})