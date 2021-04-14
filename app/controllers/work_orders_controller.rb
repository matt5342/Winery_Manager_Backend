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
        # byebug
        if @work_order.status == "Initialized"
            @work_order.completer_user_id = current_user.id
            @work_order.in_tank = work_order_params["in_tank"]
            @work_order.status = "Completed"
            @lot.volume = work_order_params["final_volume"].to_i
            @lot.tanks.delete(out_tank)
            @lot.tanks.push(in_tank)
            @lot.save
            @work_order.save
        end
    end

    private

    def work_order_params
        params.require(:work_order).permit(:name, :out_tank, :in_tank, :lot_id, :notes, :status, :final_volume)
    end
end

