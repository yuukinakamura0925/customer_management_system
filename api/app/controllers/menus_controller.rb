class MenusController < ActionController::API
  def create
    menu = Menu.new(menu_params)
    if menu.save
      render json: { status: "success", data: menu }
    else
      render json: { status: "error", data: menu.errors }
    end
  end

  def index
    menus = Menu.all
    render json: menus
  end

  def show
    menu = Menu.find(params[:id])
    render json: menu
  end

  def update
    menu = Menu.find(params[:id])
    if menu.update(menu_params)
      render json: { status: "success", data: menu }
    else
      render json: { status: "error", data: menu.errors }
    end
  end

  def destroy
    menu = Menu.find(params[:id])
    if menu.destroy
      render json: { status: "success" }
    else
      render json: { status: "error", data: menu.errors }
    end
  end

  private
  
  def menu_params
    puts(params)
    params.permit(:name, :price)
  end
end