class Admin::ProductsController < AdminController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(params[:product])
    if @product.save
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
end
