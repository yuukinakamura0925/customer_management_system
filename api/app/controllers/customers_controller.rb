class CustomersController < ActionController::API
  def create
    customer = Customer.new(customer_params)
    if customer.save
      customer_id = customer.id
    else
      render json: { status: "error", data: customer.errors }
    end
    cart = Cart.new
    cart.customer_id = customer_id
    if cart.save
      render json: { status: "success", data: customer }
    else
      render json: { status: "error", data: customer.errors }
    end
  end

  def index
    customers = Customer.includes(:cart).all
    render json: customers.as_json(include: :cart)
  end

  def show
    customer = Customer.includes(:cart).find(params[:id])
    render json: customer.as_json(include: :cart)
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      render json: { status: "success", data: customer }
    else
      render json: { status: "error", data: customer.errors }
    end
  end

  def destroy
    customer = Customer.find(params[:id])
    if customer.destroy
      render json: { status: "success" }
    else
      render json: { status: "error", data: customer.errors }
    end
  end

  private
  def customer_params
    # params.require(:customer).permit(:name, :age, :sex, :memo)
    params.permit(:name, :age, :sex, :memo)
  end
end
