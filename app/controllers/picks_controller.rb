class PicksController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.limit(6)
  end


  def next_round
    @users = User.limit(6)

    respond_to do |format|
      format.js
    end
  end

  def favorite_list
    @favorites = current_user.favorites

    respond_to do |format|
      format.js
    end
  end

  def add_favorite

    @favoriteship = current_user.favoriteships.build(favorite_id: params[:user_id].to_i)
    binding.pry
    if @favoriteship.save
      respond_to do |format|
        format.json { render :json => {status: :added} }
      end
    else
      respond_to do |format|
        format.json { render :json => {status: :add_failed} }
      end
    end
  end
end
