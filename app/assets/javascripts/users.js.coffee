# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	
	edit_controller =
		passwordIsIncorect: ->
			$('span.help-inline.pwd-is-incorrect').each (x,e) ->
				$(e).show()
		open: (obj) ->
			@.closeAll()
			$(obj).closest('tr').next('tr').show()
			@.editable(false)
		close: (obj) ->
			$(obj).closest('tr').hide();
			@.editable(true)
		closeAll: ->
			$('.edit-tr').each (x,e) ->
				$(e).hide()
			@.editable(true)
		editable: (state) ->
			$('table a.edit-hover').each (x,e) ->
				if state is true
					$(e).show()
				else
					$(e).hide()
			$('form #user_password').each (x,e) ->
				$(e).val('')

	$(user_profile).submit (e) ->
		pwd = $('form #user_password').filter (e) ->
			$.isEmptyObject($(@).val()) is false
		
		$('form #user_password:last').val(pwd.val())

		$.ajax
			type: "PUT"
			dataType: "json"
			url: "/user"
			data: $(@).serialize()
			success: (response) ->
				if response['status'] is 200
					edit_controller.closeAll()
					$.each ['email', 'first_name', 'last_name', 'alternate_name'], (idx, item) ->
						$('td#'+item).text(response['data'][item])
				edit_controller.passwordIsIncorect() if response['status'] is 403
				alert(response['message']) if response['status'] is 500
		false

	$('div.form-actions a.btn_cancel').click (e) ->
		edit_controller.close(@)
		e.preventDefault()

	$('.edit-hover').click (e) ->
		edit_controller.open(@);
		e.preventDefault()









