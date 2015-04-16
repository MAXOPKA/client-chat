class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
      t.text :data
      t.timestamps null: false
    end
  end
end
