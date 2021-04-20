class WorkOrdersController < ApplicationController
    def index
        @work_orders = current_user.work_orders
        render json: @work_orders, adapter: nil
    end
    def create
        @work_order = WorkOrder.new(work_order_params)
        @work_order.user_id = current_user.id
        if work_order_params["name"] == "Rack"
            lot = Lot.find_by(id: work_order_params["lot_id"])
            # Finds tanks and with name and picks the one associated with current_user
            in_tank = Tank.all.filter{|tank| tank.name ==  work_order_params["in_tank"]}
                    .find{|tank| tank.section.owner === current_user}
            out_tank = Tank.all.filter{|tank| tank.name ==  work_order_params["out_tank"]}
                    .find{|tank| tank.section.owner === current_user}
            in_tank_vol = 0
            out_tank_vol = 0
            current_tank_vol = 0
            # byebug
            if in_tank.lot_tanks && in_tank.lot_tanks.length > 0
                in_tank.lot_tanks.each do |lot_tank|
                    current_tank_vol += lot_tank.volume
                end
            end
            if out_tank.lot_tanks && out_tank.lot_tanks.length > 0
                out_tank.lot_tanks.each do |lot_tank|
                    out_tank_vol += lot_tank.volume
                end
            end
            if in_tank_vol + out_tank_vol > in_tank.volume
                render json: { message: "#{in_tank.name} does not have enough capacity for this volume." }, status: :not_acceptable
            else
                @work_order.save
                render json: @work_order, adapter: nil
            end
        elsif work_order_params["name"] == "Addition"
            @work_order.save
            render json: @work_order, adapter: nil
        end
        # @work_order_tank = work_orderTank.new(tank_id: params["tank_id"], work_order_id: @work_order.id, volume: @work_order.volume)
        # @work_order_tank.save
    end
    def edit
        @work_order = WorkOrder.find_by(id: params[:id])
        if @work_order.name == "Rack"
            in_tank = Tank.all.filter{|tank| tank.name ==  work_order_params["in_tank"]}
                    .find{|tank| tank.section.owner === current_user}
            out_tank = Tank.all.filter{|tank| tank.name ==  work_order_params["out_tank"]}
                    .find{|tank| tank.section.owner === current_user}
            @lot = @work_order.lot
            if @work_order.status == "Initialized"
                @work_order.completer_user_id = current_user.id
                @work_order.in_tank = work_order_params["in_tank"]
                @work_order.status = "Completed"
                @lot.volume = work_order_params["final_volume"].to_i
                # @lot.tanks.delete(out_tank) #deletes LotTank instance...change to be able to view lot history
                @lot.lot_tanks.each do |lot_tank| #sets all previous LotTanks to 0 volume
                    lot_tank.volume = 0
                    lot_tank.save
                end
                @lot.tanks.push(in_tank) #creates a new LotTank
                lot_tank = LotTank.last
                lot_tank.volume = @lot.volume #adds new volume to new LotTank
                lot_tank.save
                # byebug
                @lot.save
                @work_order.save
                render json: @work_order, adapter: nil
            end
        elsif @work_order.name == "Addition"
            if @work_order.status == "Initialized"
                @work_order.completer_user_id = current_user.id
                @work_order.status = "Completed"
                @work_order.save
                render json: @work_order, adapter: nil
            end
        end
    end

    private

    def work_order_params
        params.require(:work_order).permit(:name, :out_tank, :in_tank, :lot_id, :notes, :status, :final_volume)
    end
end

