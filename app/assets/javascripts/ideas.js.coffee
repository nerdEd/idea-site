# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#idea-title').keyup ->
    title = $(this).val()
    if title.length >= 3
      $.getJSON "/ideas/similar/#{title}", (ideas) ->
        html = _.map(ideas, ((idea) -> "<div>#{idea.title}</div>")).join('')
        $('#idea-similar').html(html)
    else
      $('#idea-similar').html('')
