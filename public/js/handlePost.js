$('#console-input').submit(function(event){
	event.preventDefault();
	$.post("/", $('#console-input').serialize(), function(result) {
		var res = JSON.parse(result);		
		var desc = res.desc
		var player = res.player.split(',');
		var status = res.is_dead
		var health = player[0].substr(player[0].indexOf(" "), player[0].length)
		var wealth = player[1].substr(player[1].indexOf(" "), player[1].length)
		var monster_tally = player[2].substr(player[2].indexOf(" "), player[2].length)
  	if(status){
  		window.location.replace("/dead");
  	}
  	$("#console-output").html(res.desc);
  	$('#input-command').val('');
  	console.log(health);
  	$('#health').html(health);
  	$('#wealth').html(wealth);
  	$('#monster_tally').html(monster_tally);  	
	});
})