# frozen_string_literal: true

class CreationUsersChatRoomsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users_chats do |t|
      t.string :role
      t.references :user, null: false, foreign_key: true
      t.references :chat_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
