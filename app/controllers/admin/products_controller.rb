class Admin::ProductsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_admin!
  before_action :set_product, only: [:show, :edit, :update, :destroy, :discount, :flag]
  
  def new 
    @product = Product.new
    if @product.images.blank?
      @product.images.build
    end
    @product.images.destroy
    @product.images.clear
  end

  def create
    @product = Product.new(product_params.merge(:category_id => params[:product][:category_id], :sub_category_id => params[:sub_category_id]))
    if @product.save
      flash[:notice] = "Product created successfully." 
      redirect_to admin_products_path, :notice =>"Product is saved successfully."
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @products = prod_cat_search Product
  end

  def edit
  end

  def update
    if params[:sub_category_id].present?
      @product.sub_category_id = params[:sub_category_id]
    end
    if @product.update_attributes(product_params)
      flash[:notice] = "Product updated successfully." 
      redirect_to admin_products_path
    else
      render action: 'edit'
    end
  end 

  def destroy
    if	@product.destroy
      flash[:notice] = "Product deleted successfully." 
  	 redirect_to admin_products_path
    end
  end

  def delete_img
    @product = Product.find(params[:product_id])
    @image = @product.images.find(params[:id])
    if @image.destroy
      flash[:notice] = "Image is deleted successfully." 
      redirect_to admin_product_path(@product)
    end
  end
  
  def image_show
    @product = Product.find(params[:id]).paginate(:page => params[:page], :per_page => 2)
    @image = @product.images.find(params[:image_id])
    @image.update_attributes(:image_show => params[:image_show])
    redirect_to admin_product_path(@product)
  end

  def discount
    @product.update_attributes
    redirect_to admin_product_path(@product)
  end


  def flag
    @product.update_attributes(:is_featured => params[:is_featured])
    redirect_to admin_products_path
  end

  def load_subcats
    @category = Category.find(params[:category_id])
    @sub_categories = @category.sub_categories
  end
  
  private
 
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :sub_category_id, :discount, :is_featured, :quantity, :color, :product_size, :category_id)
  end
end