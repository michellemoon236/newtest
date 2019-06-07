class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string :name 
      t.integer :user_id
    end
  end
end
