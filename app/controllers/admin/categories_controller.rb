class Admin::CategoriesController < ApplicationController
  before_filter :authenticate_admin!
  before_action :set_category, only: [:edit, :update, :category_show, :destroy ]

  def new 
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created successfully."
      redirect_to admin_categories_path
    else 
      render action: 'new'
    end
  end

  def index
    @categories = Category.search(params[:search]).paginate(:page => params[:page], :per_page => 20).order("created_at DESC")
  end

  def show
    @products = Product.searching(params[:id], params[:search])
  end

  def edit
    
  end

  def update
    if @category.update_attributes(category_params)
      flash[:notice] = "Category updated successfully."
      redirect_to admin_categories_path
    else
      render action: 'edit'
    end
  end

  def category_show
    @category.update_attribute(:category_show, params[:category_show])
    redirect_to admin_categories_path
	end
	

  def destroy
    if @category.destroy
      flash[:notice] = "Category deleted successfully."     
      redirect_to admin_categories_path
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :category_show)
  end
end