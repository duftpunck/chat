# frozen_string_literal: true

class ChatRoom < ApplicationRecord
  has_many :users_chats
  has_many :users, through: :users_chats
  has_many :messages, dependent: :destroy
end
