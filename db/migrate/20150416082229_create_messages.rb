class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :room
      t.belongs_to :user
      t.text :message
      t.timestamps null: false
    end
  end
end
