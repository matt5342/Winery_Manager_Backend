class TanksController < ApplicationController

    def create
        # byebug
        @tank = Tank.new(tank_params)
        @tank.winery = Winery.find_by(id: params[:id])
        @tank.save

        render json: @tank

    end

    def these_tanks
        # byebug
        current_winery = Winery.find_by(id: params[:id])
        if current_winery.tanks.length > 0
            tank_array = []
            current_winery.tanks.each do |tank|
                tank_array.push(tank_with_lot_info(tank))
            end
            render json: tank_array
        else
            render json: {error: "no tanks yet"}
        end
    end

    def this_tank
        current_winery = Winery.find_by(id: params[:id])
        current_tank = Tank.find_by(id: params["tank_id"])
        current_tank.xaxis = params["tank"]["xaxis"]
        current_tank.yaxis = params["tank"]["yaxis"]
        current_tank.width = params["tank"]["width"]
        current_tank.height = params["tank"]["height"]
        current_tank.save
    end

    def tank_with_lot_info(tank)
        # byebug
        tank_with_lots = {}
        tank_with_lots[:id] = tank.id
        tank_with_lots[:name] = tank.name
        tank_with_lots[:material] = tank.material
        tank_with_lots[:status] = tank.status
        tank_with_lots[:xaxis] = tank.xaxis
        tank_with_lots[:yaxis] = tank.yaxis
        tank_with_lots[:winery_id] = tank.winery_id
        tank_with_lots[:volume] = tank.volume
        tank_with_lots[:width] = tank.width
        tank_with_lots[:height] = tank.height
        tank_with_lots[:lots] = tank.lots
        return tank_with_lots
    end


    private

    def tank_params
        params.require(:tank).permit(:name, :volume, :material, :status, :xaxis, :yaxis, :width, :height)
    end
end
