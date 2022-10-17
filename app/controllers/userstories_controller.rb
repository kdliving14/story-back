class UserstoriesController < ApplicationController
  before_action :set_userstory, only: %i[ show update destroy ]

  # GET /userstories
  def index
    @userstories = Userstory.all

    render json: @userstories
  end

  # GET /userstories/1
  def show
    render json: @userstory
  end

  # POST /userstories
  def create
    @userstory = Userstory.new(userstory_params)

    if @userstory.save
      render json: @userstory, status: :created, location: @userstory
    else
      render json: @userstory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /userstories/1
  def update
    if @userstory.update(userstory_params)
      render json: @userstory
    else
      render json: @userstory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /userstories/1
  def destroy
    @userstory.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userstory
      @userstory = Userstory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def userstory_params
      params.require(:userstory).permit(:user_id, :story_id, :left_off)
    end
end
