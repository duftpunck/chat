# frozen_string_literal: true

class User < ApplicationRecord
  # has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users_chats
  has_many :chat_rooms, through: :users_chats
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name
    nickname
  end
end
