class CustomersController < ActionController::API
  def create
    customer = Customer.new(customer_params)
    binding.pry
    if customer.save
      render json: { status: "success", data: customer }
    else
      render json: { status: "error", data: customer.errors }
    end
  end

  def index
    customer = Customer.all
    render json: customer
  end

  def show
    customer = Customer.find(params[:id])
    render json: customer
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
    puts(params)
    # params.require(:customer).permit(:name, :age, :sex, :memo)
    params.permit(:name, :age, :sex, :memo)

  end
end
