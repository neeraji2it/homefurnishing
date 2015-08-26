class HomesController < ApplicationController
	def index
    @featured = Product.featured
    @advices = Advice.visible
    @banner_images = Banner.visible
    @guides = BuyingGuide.visible
    offer_collections
  end

  def index_test
  end
  
  def category
    @categories = SubCategory.where("id=?", params[:category_id])
    respond_to do |format|
      format.js
    end
  end
  
  def show
   (params.has_key?(:param1) && params[:param1] == 'parent') ? display_category : display_sub_category
   @featured = Product.featured
 end

  def offers
    if params.has_key?(:param1) && params.has_key?(:param2)
      category_id = params[:param1]
      discount = params[:param2]
      @products = Product.offer(category_id, discount).paginate(:page => params[:page], :per_page => 20)
    end
  end

def product_flags
  @products = Product.where("is_featured != ''")
end

def single_product
  @product = Product.find(params[:id])
  @images = @product.images
  @sub_category = @product.sub_category.present? ? (@product.sub_category) : @product.category
  @similars = @sub_category.products.where.not(id: @product.id)
end

def measurements
    @product = Product.find(params[:product_id])
     @images = @product.images
     @sub_category = @product.sub_category.present? ? (@product.sub_category) : @product.category
     @similars = @sub_category.products.where.not(id: @product.id)
  end

  def lining
  @product = Product.find(params[:product_id])
     @images = @product.images
     @sub_category = @product.sub_category.present? ? (@product.sub_category) : @product.category
     @similars = @sub_category.products.where.not(id: @product.id)
 
  end

  def confirm
 @product = Product.find(params[:product_id])
     @images = @product.images
     @sub_category = @product.sub_category.present? ? (@product.sub_category) : @product.category
     @similars = @sub_category.products.where.not(id: @product.id)
 
  end







def guide
  @guide = BuyingGuide.find(params[:id])
end

def how_to_buy

end

def faq

end

def payment

end

def shipment

end

def terms

end

def return_policy

end

def search
  products = Product.search(params[:search])
  @products = products.paginate(:page => params[:page], :per_page => 20)
end

def new_news_letter
  @news_letter = NewsLetter.new
end

def post_news_letter
  @news_letter = NewsLetter.new(news_letter_params)
  if @news_letter.save
    flash[:notice] = "Thanks, you have been subscribed to news letter."
  end
  respond_to do |format|
    format.js
  end
end

def inspirations
  @advice = Advice.find(params[:id])
end

def load_image
  @product = Product.find(params[:product_id])
  @image = @product.images.where("id=?", params[:id]).first
end

private
  # def product_params
  #   params.require(:product).permit
  # end

  def news_letter_params
    params.require(:news_letter).permit(:name, :email)
  end

  # def display_category
  #   @category = Category.find(params[:id])
  #   @categories = @category.sub_categories
  #   @products = @category.products.paginate(:page => params[:page], :per_page => 20)
  #   @header = @category.name
  # end

  def display_sub_category
    @sub_category = SubCategory.find(params[:id])
    @categories = @sub_category.category.sub_categories
    @products = @sub_category.products.paginate(:page => params[:page], :per_page => 20)
    @header = @sub_category.category.name
  end

  
 def display_category
    @sub_category = Category.find(params[:id])
    @categories = @sub_category.sub_categories
    @products = @sub_category.products.paginate(:page => params[:page], :per_page => 20)
    @header = @sub_category.name
  end

end



