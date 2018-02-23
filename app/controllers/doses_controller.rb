class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.save
    redirect_to cocktail_path(@dose.cocktail)
    # Dose.create(description: params[:description],
    # cocktail_id: params[:cocktail_id]
    # ingredient_id: params[:ingredient])
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def new
    @cocktail=  Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def destroy
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
