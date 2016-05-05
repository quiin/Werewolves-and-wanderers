$('#console-input').submit(function(event){
	event.preventDefault();
	$.post("/", $('#console-input').serialize(), function(result) {
		var res = JSON.parse(result);		
		var desc = res.desc
		var player = res.player
		var status = res.is_dead
  	$("#console-output").html(res.desc);
  	$('#input-command').val('');
  	console.log(player.substring(player.length-))
  	$('#health').replaceWith(player.health);
  	$('#wealth').replaceWith(player.wealth);
  	$('#monster_tally').replaceWith(player.monster_tally);
  	if(status){
  		window.location.replace("/dead");
  	}
	});
})