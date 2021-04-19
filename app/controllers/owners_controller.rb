class OwnersController < ApplicationController
    skip_before_action :authorized, only: [:create, :token_authenticate]

    def create
        # byebug
        @owner = Owner.create(owner_params)
        if @owner.valid?
            @token = encode_token(user_id: @owner.id)
            render json: { user: @owner, jwt: @token }, status: :created 
        else
            # byebug
            render json: @owner.errors, status: :not_acceptable
        end
    end

    def token_authenticate
        token = request.headers["Authorization"]
        decoded_token = decode(token)
        # byebug
  
        user = Owner.find(decoded_token[0]["user_id"])
        render json: user
      end


    private
    def owner_params
        params.require(:owner).permit(:username, :password, :email, :winery_name)
    end
end
