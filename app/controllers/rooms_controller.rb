class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    session.delete(:room_id)
    # session[:user_id] = 1
    cookies.signed[:room_id] = params[:id]
    # render json: cookies.signed[:room_id]
    # return
  end
end
