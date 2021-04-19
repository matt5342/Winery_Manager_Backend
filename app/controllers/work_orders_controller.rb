class WorkOrdersController < ApplicationController
    def index
        @work_orders = current_user.work_orders
        render json: @work_orders, adapter: nil
    end
    def create
        @work_order = WorkOrder.new(work_order_params)
        @work_order.user_id = current_user.id
        # byebug
        @work_order.save
        # @work_order_tank = work_orderTank.new(tank_id: params["tank_id"], work_order_id: @work_order.id, volume: @work_order.volume)
        # @work_order_tank.save
    end
    def edit
        @work_order = WorkOrder.find_by(id: params[:id])
        in_tank = Tank.find_by(name: @work_order.in_tank)
        out_tank = Tank.find_by(name: @work_order.out_tank)
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
            render json: @work_order
        end
    end

    private

    def work_order_params
        params.require(:work_order).permit(:name, :out_tank, :in_tank, :lot_id, :notes, :status, :final_volume)
    end
end

