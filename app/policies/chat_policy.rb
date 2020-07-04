# frozen_string_literal: true

class ChatPolicy < ApplicationPolicy
  attr_reader :user, :chat_room

  def initialize(user, chat_room)
    @user = user
    @chat_room = chat_room
  end

  def show?
    user.users_chats.find_by(chat_room_id: chat_room.id)&.role == 'user' or user.users_chats.find_by(chat_room_id: chat_room.id)&.role == 'admin'
  end

  def destroy?
    user.users_chats.find_by(chat_room_id: chat_room.id)&.role == 'admin'
  end
end
