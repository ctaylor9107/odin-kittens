class KittensController < ApplicationController

    def index
        @kittens = Kitten.all
    end

    def show
        @kitten = Kitten.find(params[:id])
    end

    def new
        @new_kitten = Kitten.new
    end

    def create
        @new_kitten = Kitten.new(kitten_params)

        if @new_kitten.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def edit
        @edit_kitten = Kitten.find(params[:id])
    end

    def update
        @edit_kitten = Kitten.find(params[:id])

        if @edit_kitten.update(kitten_params)
            redirect_to root_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    

    private
        def kitten_params
            params.require(:kitten).permit(:name, :age, :cuteness, :softness)
        end
end
