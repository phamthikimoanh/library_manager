
# require "rails_helper"

# class ApplicationController < ActionController::Base
#   class AccessDenied < StandardError; end

#   rescue_from AccessDenied, :with => :access_denied

# private

#   def access_denied
#     render :file => "errors/401"
#   end
# end

# RSpec.describe ApplicationController, :type => :controller do
#   controller do
#     def index
#       raise ApplicationController::AccessDenied
#     end
#   end

#   describe "handling AccessDenied exceptions" do
#     it "renders the errors/401 template" do
#       get :index
#       expect(response).to render_template("errors/401")
#     end
#   end
# end