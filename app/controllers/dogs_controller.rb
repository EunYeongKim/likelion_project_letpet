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
                      d_day: params[:d_day], shelter_id: params[:shelter_id], d_image: params[:d_image])
    if new_dog.save
      redirect_to dogs_index_path
    else
      redirect_to new_dog_path
    end
  end
  
  def edit
    @dog = Dog.find_by(id: params[:id])
    @shelters = Shelter.all.order('created_at asc')
  end
  
  def update
    @dog = Dog.find_by(id: params[:id])
    redirect_to shelter_path(params[:shelter_id]) if User.find_by(email:"admin@gmail.com").id != current_user.id
    
    @dog.d_name = params[:d_name]
    @dog.age = params[:age]
    @dog.sex = params[:sex]
    @dog.weight = params[:weight]
    @dog.species = params[:species]
    @dog.unusual = params[:unusual]
    @dog.d_day = params[:d_day]
    @dog.shelter_id = params[:shelter_id]
    # @dog.d_image = params[:d_image] if params[:d_image].present?
    @dog.d_image = params[:d_image]
    
    if @dog.save
      redirect_to shelter_path(params[:shelter_id])
    else
      render :edit
    end
  end

end
