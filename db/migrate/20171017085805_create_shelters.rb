class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|
      t.text :s_name
      t.text :s_location
      t.text :s_phone
      
      t.timestamps null: false
    end
  end
end
