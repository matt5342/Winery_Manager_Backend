class TanksController < ApplicationController

    def create
        # byebug
        @tank = Tank.new(tank_params)
        @tank.winery = current_user.wineries[0]
        @tank.save

        render json: @tank

    end

    def position_tank

    end 

    def these_tanks
        # byebug
        current_winery = Winery.find_by(id: params[:id])
        if current_winery.tanks.length > 0
            render json: current_winery.tanks
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


    private

    def tank_params
        params.require(:tank).permit(:name, :volume, :material, :status, :xaxis, :yaxis, :width, :height)
    end
end
