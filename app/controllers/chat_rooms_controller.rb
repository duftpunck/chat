# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)
    if @chat_room.save!
      current_user.users_chats.create(chat_room_id: @chat_room.id, role: 'admin')
      flash[:success] = 'Chat room added!'
      redirect_to new_users_chat_path(chat_id: @chat_room.id)
    else
      render 'new'
    end
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @users = @chat_room.users
    @message = Message.new
  end

  def destroy
    @chat_room = ChatRoom.find(params[:id])
    unless ChatPolicy.new(current_user, @chat_room).destroy?
      raise Pundit::NotAuthorizedError, "not allowed to update? this #{@chat_room.inspect}"
    end

    @chat_room.users_chats.all.delete_all
    @chat_room.destroy
    redirect_to chat_rooms_path
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
