class Admin::BannersController < ApplicationController
 before_filter :authenticate_admin!
 before_action :set_banner, only: [:show, :edit, :update, :destroy, :visible]

def index
  @banner_images = Banner.paginate(:page => params[:page], :per_page => 20)
end

def new
  @banner_image = Banner.new
end

def show
end

def create
  @banner_image = Banner.new(banner_params)
  if @banner_image.save
    redirect_to admin_banners_path
  else
    render :action => 'new'
  end
end

def edit
end

def update
  if @banner_image.update_attributes(banner_params)
    redirect_to admin_banners_path
  else
    render :action => 'edit'
  end
end

def destroy
  @banner_image.destroy
  redirect_to admin_banners_path
end

def visible
  admin_visible(@banner_image)
  redirect_to admin_banners_path
end

  private
  def banner_params
    params.require(:banner).permit(:image, :small_description, :visible, :image_description)
  end

  def set_banner
    @banner_image = Banner.find(params[:id])
  end
end
