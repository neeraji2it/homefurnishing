class Admin::OfferManagersController < ApplicationController
  before_action :load_all

  def index
    
  end

  def offer_go
    if @offer_go.update_attributes(offer_go_params)
      redirect_to admin_offer_managers_path
      flash[:notice] = "Offer-Go content are updated!"
    else
      render 'index'
    end
  end

  def offer_first
    if @offer_first.update_attributes(offer_first_params)
      redirect_to admin_offer_managers_path
      flash[:notice] = "Collection-first content are updated!"
    else
      render 'index'
    end
  end

  def offer_second
    if @offer_second.update_attributes(offer_second_params)
      redirect_to admin_offer_managers_path
      flash[:notice] = "Collection-second content are updated!"
    else
      render 'index'
    end
  end

  def offer_third
    if @offer_third.update_attributes(offer_third_params)
      redirect_to admin_offer_managers_path
      flash[:notice] = "Collection-third content are updated!"
    else
      render 'index'
    end
  end

  def offer_fourth
    if @offer_fourth.update_attributes(offer_fourth_params)
      redirect_to admin_offer_managers_path
      flash[:notice] = "Collection-fourth content are updated!"
    else
      render 'index'
    end
  end

  def offer_fifth
    if @offer_fifth.update_attributes(offer_fifth_params)
      redirect_to admin_offer_managers_path
      flash[:notice] = "Collection-fifth content are updated!"
    else
      render 'index'
    end
  end

  def offer_sixth
    if @offer_sixth.update_attributes(offer_sixth_params)
      redirect_to admin_offer_managers_path
      flash[:notice] = "Collection-sixth content are updated!"
    else
      render 'index'
    end
  end

  def offer_seventh
    if @offer_seventh.update_attributes(offer_seventh_params)
      redirect_to admin_offer_managers_path
      flash[:notice] = "Collection-seventh content are updated!"
    else
      render 'index'
    end
  end

  def offer_eighth
    if @offer_eighth.update_attributes(offer_eighth_params)
      redirect_to admin_offer_managers_path
      flash[:notice] = "Collection-eighth content are updated!"
    else
      render 'index'
    end
  end

  private
  def offer_go_params
    params.require(:offer_collection).permit(:go_text, :go_percent, :go_parent)
  end

  def offer_first_params
    params.require(:collection_first).permit(:content, :percent, :offer_parent)
  end

  def offer_second_params
    params.require(:collection_second).permit(:content, :percent, :offer_parent, :additional)
  end

  def offer_third_params
    params.require(:collection_third).permit(:content, :percent, :offer_parent, :additional, :image)
  end

  def offer_fourth_params
    params.require(:collection_fourth).permit(:content, :percent, :offer_parent, :additional, :image)
  end

  def offer_fifth_params
    params.require(:collection_fifth).permit(:content, :percent, :offer_parent, :additional, :image)
  end

  def offer_sixth_params
    params.require(:collection_sixth).permit(:content, :percent, :offer_parent, :additional, :image)
  end

  def offer_seventh_params
    params.require(:collection_seventh).permit(:content, :percent, :offer_parent, :additional, :image)
  end

  def offer_eighth_params
    params.require(:collection_eighth).permit(:content, :percent, :offer_parent, :additional, :image)
  end

  def load_all
    @offer_go = OfferCollection.first_or_initialize
    @offer_first = CollectionFirst.first_or_initialize
    @offer_second = CollectionSecond.first_or_initialize
    @offer_third = CollectionThird.first_or_initialize
    @offer_fourth = CollectionFourth.first_or_initialize
    @offer_fifth = CollectionFifth.first_or_initialize
    @offer_sixth = CollectionSixth.first_or_initialize
    @offer_seventh = CollectionSeventh.first_or_initialize
    @offer_eighth = CollectionEighth.first_or_initialize
  end

end
