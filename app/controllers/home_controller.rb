class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @br = BookOrder.all
  end
end
