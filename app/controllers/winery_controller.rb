class WineryController < ApplicationController

    def create
        # byebug
        @winery = Winery.new(winery_params)
        @winery.owner = current_user
        @winery.save

        render json: @winery

    end

    def this_winery
        # byebug
        if current_user.wineries.length > 0
            render json: current_user.wineries
        else
            render json: {error: "no wineries yet"}
        end
    end


    private

    def winery_params
        params.require(:winery).permit(:name)
    end
end


# def this_notebook
#     # byebug
#     if current_user.notebook
#         render json: current_user.notebook
#     else
#         render json: {error: "no notebook yet"}
#     end
# end

# def create
#     # byebug
#     @notebook = Notebook.new(notebook_params)
#     @notebook.user = current_user
#     @notebook.save
#     render json: @notebook

# end