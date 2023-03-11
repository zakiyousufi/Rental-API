class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user
  def index
    @users = User.all.order(:id)
    render json: @users
  end
end