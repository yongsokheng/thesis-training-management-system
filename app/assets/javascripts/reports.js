$(document).on('page:update', function() {
  quick_search_manager('input#seachTaskName', '.taskfield','');
  function quick_search_manager(inputElement, search_path) {
    $('input#seachTaskName').quicksearch(search_path, {
      'delay': 100,
      'bind': 'keyup'
    });
  }
});
