App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
  	$("#infos").append("<p>Waiting for matching user...</p>")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    switch data.action
      when "chat_start"
        $("#infos").append("<p>Chat started!</p>")
      when "chat_ending"
      	$("#infos").append("<p>User quit and Chat is end !!")
      else
        $('#messages').append(data['message'])

  speak: (message) ->
    @perform 'speak' , message: message

	$(document).on 'keypress' , '[data-action=speaking]' , (event) ->
	  if event.keyCode == 13
	    App.room.speak(event.target.value)
	    event.target.value= ''
	    event.preventDefault()     
