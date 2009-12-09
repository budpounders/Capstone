function mark_for_destroy(element) {
  $(element).next('.should_destroy').value = 1;
  $(element).up('.player_form').hide();
}