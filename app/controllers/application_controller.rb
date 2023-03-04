class ApplicationController < ActionController::Base
  before_action :authenticate_user
  @current_user = nil
end
