class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end
  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      redirect_to dogs_url, notice: "Successfully Saved!"
    else
      flash.now[:notice] = "Something went wrong and we couldn't save your doggo."

      render :new
    end

  end

  def show
    @dog = Dog.find(params[:id])
  end


  private

  def dog_params
    params.require(:dog).permit(:name, :age, :breed)

  end
end

