class ShoppingCartController < ApplicationController
  # GET /shopping_cart/1
  # GET /shopping_cart/1.json
  def show
    begin
      prepare_cart_listing
    rescue => e
      # Log the error and redirect back to the referer
      logger.error("[ShoppingCartController#show] Unable to display shopping cart items.\nClass:#{e.class}\nError:#{e.message}\nBacktrace: #{e.backtrace.join('\n')}")
      flash[:alert] = "Failed to display shopping cart items"
      redirect_back(fallback_location: root_path)
    end
  end

  def checkout
    begin
      prepare_cart_listing
    rescue
      # Log the error and redirect back to the referer
      logger.error("[ShoppingCartController#checkout] Unable to display shopping cart items")
      flash[:alert] = "Failed to display shopping cart items"
      redirect_back(fallback_location: root_path)
    end
  end  

  def add
    begin
      contents = get_cart_items

      # Attempt to find the required ticket type
      product = params[:product_id]

      # If no tickets of the given type have been added
      unless contents.has_key?(product)
        # Add the first one
        contents[product] = 1
      else
        # Otherwise, increment the ticket count
        contents[product] += 1
      end

      update_cart(contents)
      redirect_back fallback_location: productos_path, notice: "Ticket added to cart."

      #respond_to do |format|
      #  format.html { redirect_back fallback_location: root_path, notice: "Ticket added to cart." }
      #end
    rescue
      # Log the error and redirect back to the referer
      logger.error("[ShoppingCartController#add] Unable to add item to shopping cart")
      flash[:alert] = "Failed to add an item to the shopping cart"
      redirect_back(fallback_location: root_path)
    end
  end

  def remove
    begin
      contents = get_cart_items
      ttid = params[:ticket_type_id]

      unless contents.has_key?(ttid)
        raise Exception("[ShoppingCartController#show] Unable to remove item from shopping cart")
      end

      contents[ttid] -= 1
      if contents[ttid] == 0
        contents.delete(ttid)
      end

      update_cart(contents)

      flash[:notice] = "Item removed"
      redirect_back(fallback_location: root_path)

    rescue
      flash[:alert] = "Failed to remove ticket from the shopping cart"
      redirect_back(fallback_location: root_path)
    end
  end

  def zap
    # If there is a shopping cart cookie available
    if cookies.has_key?(:shopping_cart)
      # delete it
      cookies.delete(:shopping_cart)
    end
    # Redirect to the referer or root path
    redirect_back(fallback_location: root_path)
  end

  private

  include ShoppingCart

  def prepare_cart_listing
    @items = []
    @total = 0

    contents = get_cart_items

    # Traverse keys (ticket type IDs)
    contents.each_key do |k|
      # Amount of tickets per ticket type
      tt = TicketType.includes(:event).find(k)
      amount = contents[k]
      @items << { ticket_type: tt, amount: amount, total_price: amount*tt.price }
      @total += amount*tt.price
    end
  end
end