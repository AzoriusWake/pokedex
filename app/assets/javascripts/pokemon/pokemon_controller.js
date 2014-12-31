angular.module('PokemonApp.controllers', [])
.controller('pokemonAppCtrl', function($scope, $http, pokemonAPIservice) {
  $scope.PokemonList = [];
  pokemonAPIservice.getPokemons().success(function (data) {
    $scope.PokemonList = data;
  })
  $scope.Pokemon = "";
  pokemonAPIservice.getProfile().success(function (data) {
    $scope.Pokemon = data;
  })
});