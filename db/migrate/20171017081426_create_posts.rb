class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.belongs_to :user
      t.belongs_to :dog
      
      t.timestamps null: false
    end
  end
end
