class AddOrderProdcutRefToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :order_product, null: false, foreign_key: true
  end
end
