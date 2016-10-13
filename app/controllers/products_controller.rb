class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    # binding.pry
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def description
    product = Product.find(params[:id])
    render plain: "#{product.description}"
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory
      if product.inventory > 0
        render plain: "true"
      else
        render plain: "false"
      end
    end
  end

  def more
    @product = Product.find(params[:id])
    text = "#{@product.description}"
    # binding.pry
    if @product.inventory
      if @product.inventory > 0
        text << " Available"
      else
        text << "Sold Out"
      end
    else
    end
    render plain: text
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end

end
