class Product < ApplicationRecord
  belongs_to :temperature
  belongs_to :vendor
end
