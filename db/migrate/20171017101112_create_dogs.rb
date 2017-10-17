class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.text :d_name
      t.integer :age
      t.text :sex
      t.integer :weight
      t.text :species
      t.text :unusual
      t.datetime :d_day
      t.text :d_state
      t.belongs_to :shelter
      
      t.timestamps null: false
    end
  end
end
