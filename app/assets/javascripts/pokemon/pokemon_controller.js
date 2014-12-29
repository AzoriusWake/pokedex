angular.module('PokemonApp.controllers', [])
.controller('pokemonAppCtrl', function($scope, $http, pokemonAPIservice) {
  $scope.PokemonList = [];
  $scope.Pokemon = "";
  pokemonAPIservice.getPokemons().success(function (data) {
    $scope.PokemonList = data;
    $scope.Pokemon = data[0];
  })
});