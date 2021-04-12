class LotsController < ApplicationController

    def create
        byebug
        @lot = Lot.new(lot_params)
        @lot.owner = current_user
        @lot.save
        @lot_tank = LotTank.new(tank_id: params["tank_id"], lot_id: @lot.id, volume: @lot.volume)
        @lot_tank.save
    end

    private

    def lot_params
        params.require(:lot).permit(:name, :volume, :vintage, :status, :color)
    end
end
