# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready ->
	$('.carousel').carousel({interval: false})
	$('.goto_passwordReset').click (e) ->
		$('.carousel').carousel(2)
		e.preventDefault()

	$('.goto_signup').click (e) ->
		$('.carousel').carousel(0)
		e.preventDefault()

	$('.goto_signin').click (e) ->
		$('.carousel').carousel(1)
		e.preventDefault()

	$('#homeCarousel a[class*="goto_"]').click (e) ->
		window.location.hash = $(@).attr("id")

	hash = window.location.hash.split("#").slice("1")
	if ['signup','signin','passwordReset'].indexOf(hash[0]) >= 0
		$('.carousel').carousel(['signup','signin','passwordReset'].indexOf(hash[0]))


