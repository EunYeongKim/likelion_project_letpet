class Shelter < ActiveRecord::Base
    has_many :dogs
    mount_uploader :s_image, ShelterImageUploader
end
