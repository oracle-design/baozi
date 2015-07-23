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
end
