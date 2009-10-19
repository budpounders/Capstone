/*
 Modify clock to fit your needs
*/

var ChessClock = function (player) {
	this.player = player;
	this.seconds = 0;
	this.on = 0;

	this.start = function () {
		this.on = 1;
	};

	this.stop = function () {
		this.on = 0;
	}

}

ChessClock.prototype.tick = function () {
	if (this.on) {
		var i = document.getElementById(this.player);
		i.value = toTime(++this.seconds);	
	}
};

var timeout;
var player1 = new ChessClock('clock1');

function tick() {
	clearTimeout(timeout);
	timeout = setTimeout(tick, 1000);

	player1.tick();
}

function start() {

	if (!player1.on) {
		player1.start();
	} else {
		player1.stop();
	}

	tick();
}

function reset() {
	clearTimeout(timeout);
	player1.stop();
	player1.seconds = 0;

	document.getElementById('clock1').value=0;
}


function toTime (secs) {
	//minutes
	var hours = Math.floor(secs/3600);
	var min = Math.floor((secs-hours*3600)/60);
	var secs = secs - (min*60);

	return hours + (min<10?':0':':')+min +(secs<10?':0':':') + secs;
}

