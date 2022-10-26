class Product < ApplicationRecord
    belongs_to :company
    has_many :order_products
    has_many :images
end
