class LotsController < ApplicationController

    def create
        # byebug
        @lot = Lot.new(lot_params)
        @lot.owner = current_user
        @lot.save
        @lot_tank = LotTank.new(tank_id: params["tank_id"], lot_id: @lot.id, volume: @lot.volume)
        @lot_tank.save

        render json: @lot
    end
    def these_lots
        @lots = Lot.all.filter{|lot| lot.owner_id == current_user.id}
        render json: @lots
    end

    private

    def lot_params
        params.require(:lot).permit(:name, :volume, :vintage, :status, :color)
    end
end
