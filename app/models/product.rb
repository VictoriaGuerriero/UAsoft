class Product < ApplicationRecord
    belongs_to :company
    belongs_to :order_product
end
