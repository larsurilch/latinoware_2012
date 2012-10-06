# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(document).on 'click', '.alert', (e) ->
    $(this).fadeOut -> 'slow'
    false
  
  $('.notice').animate(opacity: 1.0, 3000).fadeOut -> 'slow'
  
  $(document).on 'change', '#state', (e) ->
    if $(this).val()
      $.getJSON("/states/" + $(this).val() + '/cities.json', (data) ->
        $('#city')
          .empty()
          .selectmenu('refresh', true)
          
        $.each(data, (i,item) ->
          $('#city')
            .append('<option value="' + item.id + '">' + item.name + '</option>')
            .selectmenu('refresh', true)
        )
      )
    else
      $('#city')
        .empty()
        .append('<option value="">Selecione primeiro um Estado</option>').selectmenu('refresh', true)