class SetDefaultValueForUserActive < ActiveRecord::Migration
  def self.up
    change_column :users, :active, :boolean, default: true
  end

  def self.down
    change_column :users, :active, :boolean, default: nil
  end
end
