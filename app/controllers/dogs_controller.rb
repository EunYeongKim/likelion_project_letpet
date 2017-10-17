class DogsController < ApplicationController
  def index
    @dogs = Dog.all.order('created_at asc')
    @shelters = Shelter.all.order('created_at asc')
  end
  
  def new
    @shelters = Shelter.all.order('created_at asc')
  end

  def create
    new_dog = Dog.new(d_name: params[:d_name], age: params[:age], sex: params[:sex], 
                      weight: params[:weight], species: params[:species], unusual: params[:unusual],
                      d_day: params[:d_day], shelter_id: params[:shelter_id])
    if new_dog.save
      redirect_to dogs_index_path
    else
      redirect_to new_dog_path
    end
  end

end
