class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[ show update destroy ]

  # GET /inventories
  def index
    render json: @current_user.inventories
  end

  # POST /inventories
  def create
    inventory = Inventory.create!(inventory_params)

    if inventory.save
      render json: inventory, status: :created, location: @inventory
    else
      render json: inventory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /inventories/1
  def destroy
    @inventory.destroy!
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_params
      params.require(:inventory).permit(:userstory_id, :item_id)
    end
end
