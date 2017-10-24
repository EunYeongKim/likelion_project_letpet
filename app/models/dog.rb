class Dog < ActiveRecord::Base
    belongs_to :shelter
    has_one :post
    mount_uploader :d_image, DogImageUploader
end
