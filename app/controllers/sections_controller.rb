class SectionsController < ApplicationController
    def create
        # byebug
        @section = Section.new(section_params)
        @section.owner = current_user
        @section.save

        render json: @section

    end

    def this_section
        # byebug
        if current_user.sections.length > 0
            render json: current_user.sections
        else
            render json: {error: "no sections yet"}
        end
    end


    private

    def section_params
        params.require(:section).permit(:name)
    end
end
