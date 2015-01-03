angular.module('PokemonApp.services', []).
factory('pokemonAPIservice', function($http) {
  var pokemonAPI = {};
  pokemonAPI.getPokemons = function() {
    return $http({
      method: 'get',
      url: '/pokemon/endpoint'
    });
  }
  pokemonAPI.getProfile = function() {
    return $http({
      method: 'get',
      url: '/pokemon/profile'
    });
  }
  return pokemonAPI;
});