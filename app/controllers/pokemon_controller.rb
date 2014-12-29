class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all
    @pokemon = Pokemon.first
  end
  def endpoint
    pokemons = Pokemon.all
    render json: pokemons
  end
end
