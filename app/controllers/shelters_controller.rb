class SheltersController < ApplicationController
  before_action :authenticate_user!
 
  def index
  end
  
  def index
    @shelters = Shelter.all.order('created_at asc')
  end
  
  def new
  end
  
  def create
    new_shelter = Shelter.new(s_name: params[:s_name],s_location: params[:s_location],s_phone: params[:s_phone], s_image: params[:s_image])
    
    if new_shelter.save
      redirect_to shelters_index_path
    else
      redirect_to new_shelter_path
    end
    
  end
  
  def show
    @shelter = Shelter.find_by(id: params[:id])
    @Dogs = Dog.where(shelter_id: params[:id])
  
  end
  
  def edit
    @shelter = Shelter.find_by(id: params[:id])
  end
  
  def update
    @shelter = Shelter.find_by(id: params[:id])
    redirect_to shelter_index_path(params[:shelter_id]) if User.find_by(email:"admin@gmail.com").id != current_user.id
    
    @shelter.s_name = params[:s_name]
    @shelter.s_location = params[:s_location]
    @shelter.s_phone = params[:s_phone]
    # @shelter.s_image = params[:s_image] if params[:s_image].present?
    @shelter.s_image = params[:s_image]
    
    if @shelter.save
      redirect_to shelter_index_path(params[:id])
    else
      render :edit
    end
  end
  
end
