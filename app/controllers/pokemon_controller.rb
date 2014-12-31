class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end
  def endpoint
    pokemons = Pokemon.all
    render json: pokemons
  end
  def profile
    pokemon = if params["id"]
                pokemon.find_by(name: params["id"])
              else
                Pokemon.first
              end
    render json: pokemon
    # pokemon = Pokemon.first
    # render json: pokemon
  end
end
