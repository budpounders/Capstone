document.observe("dom:loaded", handleStuff )

function handleStuff(event) {
  player1.seconds = parseInt($('game_time').value)-1;
  start();start();
  
  var player_forms = $$('form.wazza')
  
  player_forms.each( function (f, i) {
    submitInput = f.getInputs('submit')[0];

    submitInput.observe('click', function(event) {
      the_hidden_input=player_forms[parseInt(this.name)-1].getInputs('hidden')[1]
      the_hidden_input.value=$F('clock1');      
    })
  }) 
}
