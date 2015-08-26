$(document).ready(function(){
  html_first = '<input type="text" name="recipe_ingredients[]" class="form-control" id="ingredients_';
  html_last = '"  placeholer="e.g. Chicken">';
  counter = 1;
  $('#add_ingredient').click(function(){
    counter += 1;
    $("#ingredients_" + counter + ").append(html_first + counter + html_last);
  });
});
