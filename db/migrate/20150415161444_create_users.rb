class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login, :null => false
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :single_access_token, :null => false
      t.string :persistence_token, :null => false
      t.timestamps null: false
    end

    User.create({ login: "admin", password: "123456", password_confirmation: "123456" })

  end

  def self.down
    drop_table :users
  end
end
