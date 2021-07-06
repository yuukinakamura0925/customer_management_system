class CartsController < ApplicationController
  def create
    cart = Cart.new(cart_params)
    if cart.save
      render json: { status: "success", data: cart }
    else
      render json: { status: "error", data: cart.errors }
    end
  end

  def show
    # Billでcart_detailsをひっぱってくるためのincludes
    cart = Cart.includes(:cart_details).find(params[:id])
    # render json: cart
    render json: { data: cart.as_json(include: :cart_details)}
  end

  def update
    cart = Cart.find(params[:id])
    if cart.update(cart_params)
      render json: { status: "success", data: cart }
    else
      render json: { status: "error", data: cart.errors }
    end
  end

  def destroy
    cart = Cart.find(params[:id])
    if cart.destroy
      render json: { status: "success" }
    else
      render json: { status: "error", data: cart.errors }
    end
  end

  private
  def cart_params
    # params.require(:cart).permit(:name, :age, :sex, :memo)
    params.permit(:customer_id)
  end
end
