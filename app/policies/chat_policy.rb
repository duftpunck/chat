class ChatPolicy < ApplicationPolicy
  attr_reader :user, :chat_room

  def initialize(user, chat_room)
    @user = user
    @chat_room = chat_room
  end 

  def destroy?
    user.users_chats.find_by(chat_room_id: record.id).role == 'admin'
  end
end