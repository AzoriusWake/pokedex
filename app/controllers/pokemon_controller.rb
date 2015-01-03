class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end
  def endpoint
    pokemons = Pokemon.all
    render json: pokemons
  end
  def profile
    pokemon = if params["name"]
                Pokemon.find_by(name: params["name"])
              else
                Pokemon.first
              end
    render json: pokemon
  end
  def show
    pokemon = Pokemon.find(params[:id])
    render json: pokemon
  end
end
