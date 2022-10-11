class PagesController < ApplicationController
    def home
        @products = Product.order(price: :desc)
    end
end
