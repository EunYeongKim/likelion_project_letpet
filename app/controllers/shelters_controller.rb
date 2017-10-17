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
    new_shelter = Shelter.new(s_name: params[:s_name],s_location: params[:s_location],s_phone: params[:s_phone])
    
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
end
