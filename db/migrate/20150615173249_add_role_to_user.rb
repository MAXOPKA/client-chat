class AddRoleToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :string, default: "client"

    User.all.each{ |u| u.role = "client"; u.save }
    admin = User.find_by_login("admin")
    admin.role = "admin"
    admin.save
  end

  def self.down
    remove_column :users, :role
  end
end
