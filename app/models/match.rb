class Match < ApplicationRecord
  def self.create(current_channel)
    if REDIS.spop("seeks_#{current_channel}")
      Room.start(current_channel)
    else
      REDIS.sadd("seeks_#{current_channel}", current_channel)
    end
  end

  def self.remove(current_channel)
    REDIS.srem("seeks_#{current_channel}", current_channel)
  end

  def self.clear_all(current_channel)
    REDIS.del("seeks_#{current_channel}")
  end
end
