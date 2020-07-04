# frozen_string_literal: true

class UsersChat < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates_uniqueness_of :user_id, scope: [:chat_room_id]
end
