class Api::UsersController < ApplicationController

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    # if current_user
      if @user.save
        render 'show.json.jb'
      else
        render json: { errors: @user.errors.full_messages }, status: :bad_request
      end
    # else
    #   render json: {mesage: "user not logged in"}
    # end
  end

end
