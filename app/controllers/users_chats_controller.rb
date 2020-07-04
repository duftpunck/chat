# frozen_string_literal: true

class UsersChatsController < ApplicationController
  def new
    @users = User.all
    render
  end

  def bulk_create
    @users = User.where(id: params[:user_ids])
    @chat_room = ChatRoom.find(params[:chat_id])
    @users.each do |user|
      UsersChat.create(user_id: user.id, chat_room: @chat_room, role: 'user')
    end
    redirect_to @chat_room
  end

  def destroy
    users_chat = UsersChat.find(params[:id])
    @chat_room = ChatRoom.find(users_chat.chat_room_id)
    users_chat.delete
    redirect_to @chat_room
  end
end
