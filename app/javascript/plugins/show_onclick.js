const showOnclick = () => {
  $('#new_review').hide()
$(document).ready(function() {
    $('#add-your-review').click(function() {
        $('#new_review').toggle('slow');
    });
});
}

export { showOnclick };
