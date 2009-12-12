var seconds = parseInt($('clock1').value.substring(0,2)) * 60 + parseInt($('clock1').value.substring(3,5));
var on = false;

var timeout;
var clock_enabled=true;



function tick() {
  if((on) &&(seconds>0))
	{
  	timeout = setTimeout(tick, 1000);

  	seconds = seconds-1;
  	$('clock1').value=toTime(seconds);  
  }
}

function start() {

	if (!on) {
		on=true
	} 
	else {
	  clearTimeout(timeout);
    on=false; 
	}

	tick();
}

function reset() {
	clearTimeout(timeout);
	on=false
  seconds = 1200;
  clock_enabled=true;
  
	document.getElementById('clock1').value='20:00';
}


function toTime (secs) {
   //minutes
  var min = Math.floor(secs/60);
  var secs = secs % 60;
  
  return (min<10?'0':'')+min +(secs<10?':0':':') + secs;
}

