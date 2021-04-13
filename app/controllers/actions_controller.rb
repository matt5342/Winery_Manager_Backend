class ActionsController < ApplicationController

    def index
        @actions = Action.all
        render json: @actions
    end
    def create
        byebug
        @action = Action.new(action_params)
        @action.ordered_by = current_user
        # @action.winery = 
        @action.save
        # @action_tank = actionTank.new(tank_id: params["tank_id"], action_id: @action.id, volume: @action.volume)
        # @action_tank.save
    end

    private

    def action_params
        params.require(:action).permit(:name, :tank_id, :lot_id, :notes, :status)
    end
end
