class Admin::AdvicesController < ApplicationController
  before_filter :authenticate_admin!
  before_action :set_advice, only: [:edit, :update, :destroy, :visible]

  def index
    @advices = Advice.paginate(:page => params[:page], :per_page => 20)
  end
  
  def new
   @advice = Advice.new 
  end
  
  def create
    @advice = Advice.new(advice_params)
    if @advice.save
      flash[:notice] = "Advices created Successfully"
      redirect_to admin_advices_path
    else
      render :action => :new
    end
  end
  
  def edit
    
  end
  
  def update
    if @advice.update_attributes(advice_params)
      flash[:notice] = "Advices updated Successfully"
      redirect_to admin_advices_path
    else
      render :action => :new
    end

  end
  
  def destroy
    if @advice.destroy
      flash[notice] = "Advices deleted Successfully"
      redirect_to admin_advices_path
    end
  end

  def visible(@advice)
    redirect_to admin_advices_path
  end
  
  private
  def set_advice
    @advice = Advice.find(params[:id])
  end

  def advice_params
    params.require(:advice).permit(:title, :description, :avatar, :visible)
  end
end