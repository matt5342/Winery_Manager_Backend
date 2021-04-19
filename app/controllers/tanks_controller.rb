class TanksController < ApplicationController

    def index
        tanks = current_user.tanks
        tank_array = []
        tanks.each do |tank|
            tank_array.push(tank_with_lot_info(tank))
        end
        render json: tank_array, adapter: nil
    end
    def create
        @tank = Tank.new(tank_params)
        @tank.section = Section.find_by(id: params[:id])
        if @tank.valid? 
            render json: @tank
            @tank.save
        else
            render json: @tank.errors, status: :not_acceptable
        end
        # byebug
    end
    

    def these_tanks
        # byebug
        current_section = Section.find_by(id: params[:id])
        if current_section.tanks.length > 0
            tank_array = []
            current_section.tanks.each do |tank|
                tank_array.push(tank_with_lot_info(tank))
            end
            render json: tank_array, adapter: nil
        else
            render json: {error: "no tanks yet"}
        end
    end

    def this_tank
        tank = Tank.find_by(id: params[:id])
        tank_with_lot = tank_with_lot_info(tank)
        render json: tank_with_lot, adapter: nil
    end

    def edit_tank
        current_section = Section.find_by(id: params[:id])
        current_tank = Tank.find_by(id: params["tank_id"])
        current_tank.xaxis = params["tank"]["xaxis"]
        current_tank.yaxis = params["tank"]["yaxis"]
        current_tank.width = params["tank"]["width"]
        current_tank.height = params["tank"]["height"]
        current_tank.save
    end

    def tank_with_lot_info(tank)
        # adds lots in tank and all work orders from those lots
        tank_with_lots = {}
        tank_with_lots[:id] = tank.id
        tank_with_lots[:name] = tank.name
        tank_with_lots[:material] = tank.material
        tank_with_lots[:status] = tank.status
        tank_with_lots[:xaxis] = tank.xaxis
        tank_with_lots[:yaxis] = tank.yaxis
        tank_with_lots[:section_id] = tank.section_id
        tank_with_lots[:volume] = tank.volume
        tank_with_lots[:width] = tank.width
        tank_with_lots[:height] = tank.height
        tank_with_lots[:lots] = tank.lots #adds array to tank_with_lots to avoid issues with empy tank
        if tank.lot_tanks
            # byebug
            lot_array = []
            tank.lot_tanks.each do |lot_tank|
                if lot_tank.volume > 0
                    lot_array.push(Lot.find_by(id: lot_tank.lot_id))
                end
            end
            tank_with_lots[:lots] = lot_array #only includes lots where lot_tank volume is > 0
        end
        if tank_with_lots[:lots].length > 0
            tank_with_lots[:lots].each do |lot|
                # byebug
                if lot.work_orders.length > 0
                    work_order_array = []
                    lot.work_orders.each do |work_order|
                        work_order_array.push(work_order)
                    end
                    tank_with_lots[:work_orders] = work_order_array
                end
            end
        end
        return tank_with_lots
    end


    private

    def tank_params
        params.require(:tank).permit(:name, :volume, :material, :status, :xaxis, :yaxis, :width, :height)
    end
end
