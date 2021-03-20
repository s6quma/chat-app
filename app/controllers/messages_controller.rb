class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html {redirect_to room_messages_path(@room)}
        format.json
      end
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    message = Message.find(params[:id])
    messages = @room.messages.includes(:user)
    if message.destroy
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
