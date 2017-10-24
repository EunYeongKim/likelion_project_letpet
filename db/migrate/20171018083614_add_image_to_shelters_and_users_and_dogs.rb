class AddImageToSheltersAndUsersAndDogs < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :shelters, :s_image, :string
    add_column :dogs, :d_image, :string
  end
end
