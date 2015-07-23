class PrototypeController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.limit(6)
  end

end
