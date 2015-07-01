class Admin::GuidesController < ApplicationController
  before_filter :authenticate_admin!
  before_action :set_guide, only: [:edit, :update, :destroy, :visible]

  def index
    @guides = BuyingGuide.all.paginate(:page => params[:page], :per_page => 20)
  end
  
  def new
    @guide = BuyingGuide.new
  end
  
  def create
    @guide = BuyingGuide.new(guides_params)
    if @guide.save
      redirect_to admin_guides_path
    else
      render :action => :new
    end
  end
  
  def edit
    
  end
  
  def update
    if @guide.update_attributes(guides_params)
      flash[:notice] = "Buying Guide updated Successfully"
      redirect_to admin_guides_path
    else
      render :action => :new
    end

  end
  
  def destroy
    if @guide.destroy
      flash[notice] = "BuyingGuides deleted Successfully"
      redirect_to admin_guides_path
    end
  end

  def visible(@guide)
    redirect_to admin_guides_path
  end
  
  private
  def set_guide
    @guide = BuyingGuide.find(params[:id])
  end

  def guides_params
    params.require(:buying_guide).permit(:title, :description, :image, :visible)
  end
end