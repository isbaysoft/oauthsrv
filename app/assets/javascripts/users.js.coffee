# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

_.templateSettings =  interpolate :/\{\{(.+?)\}\}/g

$(document).ready ->
	$('.edit-hover').click (e) ->
		$(this).closest('tr').next('tr').toggle()
		e.preventDefault()









