class CartDetailsController < ApplicationController
   def create
    cart_detail = Cart_detail.new(cart_detail_params)
    if cart_detail.save
      render json: { status: "success", data: cart_detail }
    else
      render json: { status: "error", data: cart_detail.errors }
    end
  end

  def index
    cart_details = Cart_detail.all
    render json: cart_details
  end

  def show
    cart_detail = Cart_detail.find(params[:id])
    render json: cart_detail
  end

  def update
    cart_detail = Cart_detail.find(params[:id])
    if cart_detail.update(cart_detail_params)
      render json: { status: "success", data: cart_detail }
    else
      render json: { status: "error", data: cart_detail.errors }
    end
  end

  def destroy
    cart_detail = Cart_detail.find(params[:id])
    if cart_detail.destroy
      render json: { status: "success" }
    else
      render json: { status: "error", data: cart_detail.errors }
    end
  end

  private
  def cart_detail_params
    # params.require(:cart_detail).permit(:name, :age, :sex, :memo)
    params.permit(:cart, :menu, :qty, :price)
  end
end
