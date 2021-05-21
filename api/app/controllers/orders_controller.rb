class OrdersController < ApplicationController
def create
    order = Order.new(order_params)
    puts order_params
    puts order_params
    puts order_params
    puts order_params
    puts order_params
    
    if order.save
      render json: { status: "success", data: order }
    else
      render json: { status: "error", data: order.errors }
    end
  end

  def index
    orders = Order.all
    render json: orders
  end

  def show
    order = Order.find(params[:id])
    render json: order
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
  def order_params
    params.permit(:customer_id, :order_detail_id)
  end
end
