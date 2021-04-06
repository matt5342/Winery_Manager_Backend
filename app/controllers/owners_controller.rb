class OwnersController < ApplicationController

    def create
        @owner = Owner.create(owner_params)
        if @owner.valid?
            render json: { owner: @owner, status: created }
        else
            render json: { error: 'failed to create user'}, status: :not_acceptable
        end
    end



    private
    def owner_params
        params.require(:owner).permit(:username, :password, :email)
    end
end
