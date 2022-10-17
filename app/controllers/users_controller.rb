class UsersController < ApplicationController

  # # GET /users
  # def index
  #   @users = User.all
  #   render json: @users
  # end

  # GET current user
  def show
    render json: @current_user
  end

  # POST /users
  def create
    user = User.create!(user_params)

    if user.save
      render json: user, status: :created, location: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @current_user.update!(user_params)
      render json: @current_user
    else
      render json: @current_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @current_user.destroy
    head :no_content
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password, :name, :email, :image_url)
    end
end
