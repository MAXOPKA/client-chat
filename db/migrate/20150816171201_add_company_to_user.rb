class AddCompanyToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :description, :text
    add_column :users, :company, :string
  end

  def self.down
    remove_column :users, :description
    remove_column :users, :company
  end
end
