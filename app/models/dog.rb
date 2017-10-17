class Dog < ActiveRecord::Base
    belongs_to :shelter
    has_one :post
end
