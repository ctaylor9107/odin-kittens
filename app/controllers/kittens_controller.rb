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
            flash[:success] = "Great! You now have a new kitten!"
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
            flash[:success] = "Great! You updated your kitten's info!"
            redirect_to root_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.destroy

        flash[:success] = "Aww, this kitten is now gone."
        redirect_to root_path, status: :see_other
    end

    

    private
        def kitten_params
            params.require(:kitten).permit(:name, :age, :cuteness, :softness)
        end
end
