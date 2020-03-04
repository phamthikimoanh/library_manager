class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all.page params[:page]
    
    @users = User.all
    @u = @users.group_by_day(:created_at, range: 1.weeks.ago.midnight..Time.now).count
    @br = BookOrder.all
  end
end
