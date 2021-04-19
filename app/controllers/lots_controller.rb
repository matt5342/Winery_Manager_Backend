class LotsController < ApplicationController

    def create
        @lot = Lot.new(lot_params)
        @lot.owner = current_user
        
        tank = Tank.find_by(id: params["tank_id"])
        current_tank_vol = 0
        tank.lot_tanks.each do |lot_tank|
            current_tank_vol += lot_tank.volume
        end
        new_vol = current_tank_vol + lot_params["volume"].to_i 
        if new_vol > tank.volume
            # byebug
            render json: { message: "#{tank.name} does not have enough capcity for this volume." }, status: :not_acceptable
        else 
            @lot.save
            @lot_tank = LotTank.new(tank_id: params["tank_id"], lot_id: @lot.id, volume: @lot.volume)
            @lot_tank.save
            render json: @lot, adapter: nil
        end

    end
    def these_lots
        @lots = Lot.all.filter{|lot| lot.owner_id == current_user.id}
        render json: @lots, adapter: nil
    end

    private

    def lot_params
        params.require(:lot).permit(:name, :volume, :vintage, :status, :color)
    end
end
