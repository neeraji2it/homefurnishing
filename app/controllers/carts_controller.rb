class CartsController < ApplicationController
  before_action :load_cart, except: [:destroy]

  def show
  end

  def index
    @products = current_cart.line_items
  end

  def destroy
    @cart = LineItem.find(params[:id])
    if @cart.destroy
      if !current_cart.line_items.present?
        current_cart.destroy
        session[:cart_id] = nil
      end
      redirect_to carts_path
    end
  end

  def empty_carts
    if current_cart.line_items.present?
      current_cart.destroy
      session[:cart_id] = nil
    end
    redirect_to carts_path
  end

  def update
    @products = current_cart.line_items
    @li = LineItem.find(params[:id])
    @li.update(:quantity => params[:quantity])
    respond_to do |format|
      format.js
    end
  end
  
  def discount
    @products = current_cart.line_items
  end

  def payu_return
    notification = PayuIndia::Notification.new(request.query_string, options = {:key => 'tzY9Gq', :salt => 'WX29JXLQ', :params => params})

    @cart = Cart.find(notification.invoice) # notification.invoice is order id/cart id which you have submited from payment direction page.

    if notification.acknowledge     
      begin
        if notification.complete?         
          @cart.status = 'success'
          @cart.purchased_at = Time.now
          @order = Order.create(:total => notification.gross, :card_holder_name => params['name_on_card'], :order_number => notification.invoice)
          reset_session
          redirect_to @order
        else         
          @cart.status = "failed"
          render :text => "Order Failed! #{notification.message}"
        end
      ensure
        @cart.save
      end
    end   
  end

  private
  def load_cart
    @cart = current_cart
  end
end