class WorkOrderController < ApplicationController
    def index
        @work_orders = WorkOrder.all
        render json: @work_orders
    end
    def create
        byebug
        @work_order = WorkOrder.new(work_order_params)
        @work_order.user_id = current_user.id
        # @work_order.section = 
        @work_order.save
        # @work_order_tank = work_orderTank.new(tank_id: params["tank_id"], work_order_id: @work_order.id, volume: @work_order.volume)
        # @work_order_tank.save
    end

    private

    def work_order_params
        params.require(:work_order).permit(:type, :tank_id, :lot_id, :notes, :status)
    end
end
