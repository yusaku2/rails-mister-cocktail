class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def destroy
    @cocktail = Cocktail.find(params[cocktail_params])
    @cocktail.destroy
    redirect_to cocktail_path(@cocktail)
  end
private
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
