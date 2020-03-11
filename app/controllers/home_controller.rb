class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    # Show book for user
    @books = Book.all.page params[:page]

    # Chart user
    @users = User.all
    @u = @users.group_by_day(:created_at, range: 1.weeks.ago.midnight..Time.now).count
  end

  def get_ajax
    json =  params[:data]
    if json != nil
      data = JSON.parse(json)
      # Chart borrow_book
      start_day =  Date.parse(data['start']).beginning_of_day
      end_day =  Date.parse(data['end']).end_of_day
      @bo = BookOrder.where(created_at: start_day..end_day)
      @br = @bo.group(:created_at).count 
      render 'get_ajax.js.erb'
    end
  end
end