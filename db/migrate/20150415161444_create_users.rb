class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login, null: false
      t.string :crypted_password, null: false
      t.string :password_salt, null: false
      t.string :single_access_token, null: false
      t.string :persistence_token, null: false
      t.string :first_name, null: false
      t.string :second_name
      t.string :role, default: 'client'
      t.boolean :active
      t.string :avatar
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
