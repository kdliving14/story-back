class UserchoicesController < ApplicationController
  before_action :set_userchoice, only: %i[ show destroy ]

  # GET /userchoices
  def index
    render json: @current_user.userchoices 
  end

  # GET /userchoices/1
  def show
    render json: @userchoice
  end

  # POST /userchoices
  def create
    @userchoice = Userchoice.create!(userchoice_params)

    if @userchoice.save
      render json: @userchoice, status: :created, location: @userchoice
    else
      render json: @userchoice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /userchoices/1
  def destroy
    @userchoice.destroy!
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userchoice
      @userchoice = Userchoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def userchoice_params
      params.require(:userchoice).permit(:userstory_id, :event_id, :choice_id)
    end
end
