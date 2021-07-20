class OrdersController < ApplicationController
def create
    # カートを引っ張ってくる
    cart = Cart.find(params[:cart_id])
    customer_id = cart.customer_id
    # カートディテールズ取得
    cart_details = CartDetail.where(cart_id: cart.id)
    # オーダーを登録する
    order = Order.new
    order.customer_id = customer_id
    if order.save
      render json: { status: "success", data: order }
      # オーダーID取得
      order_id = order.id
    else
      render json: { status: "error", data: order.errors }
    end
    order_details = []
    cart_details.each do |cart_detail|
      order_detail = OrderDetail.new 
        
      # オーダーディテールID取得
      order_detail.order_id = order_id
      order_detail.menu_price = cart_detail.price 
      # order_detail.qty = cart_detail.qty
      menus.each do |menu|
        if menu.id == cart_detail.menu_id
          order_detail.menu_name = menu.name
        end
      end
        
      order_details << order_detail
    end
    
    OrderDetail.import order_details
    cart_details.destroy_all 
  end

  def index
    orders = Order.all
    render json: orders
  end

  def show
    order = Order.includes(:order_details).find(params[:id])
    render json: { data: order.as_json(include: :order_details)}
  end

  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      render json: { status: "success", data: order }
    else
      render json: { status: "error", data: order.errors }
    end
  end

  def destroy
    order = Order.find(params[:id])
    if order.destroy
      render json: { status: "success" }
    else
      render json: { status: "error", data: order.errors }
    end
  end

  private
  def create_order_params
    
  end

  def order_params
    params.permit(:customer_id, :order_detail_id)
  end
end
