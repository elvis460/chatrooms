# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
      stream_from "room_channel_#{current_channel}"
  end

  def unsubscribed
  end

  def speak(data)
    Message.create! content: data['message'] ,user_id: 1 ,room_id: current_channel
  end
end
