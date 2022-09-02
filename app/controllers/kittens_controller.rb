class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = 'Kitten creation successful.'
      redirect_to @kitten
    else
      flash[:alert] = "An error occurred, please check your inputs and try again."
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end


  def show
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:notice] = 'Kitten edit successful.'
      redirect_to @kitten
    else
      flash[:alert] = "An error occurred, please check your inputs and try again."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
