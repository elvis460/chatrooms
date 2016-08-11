class Room < ApplicationRecord
  has_many :messages , dependent: :destroy
  has_many :users , through: :messages

  def self.start(current_channel)
    ActionCable.server.broadcast "room_channel_#{current_channel}" , {action: "chat_start"}
  end

  def self.chat_end(uuid)
    ActionCable.server.broadcast "room_channel_#{current_channel}" , {action: "chat_ending"}
  end
end
